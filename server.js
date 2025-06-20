const express = require('express');
const cors = require('cors');
const mysql = require('mysql2');
const path = require('path');
const app = express();
const PORT = 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// เชื่อมต่อ MySQL (dev config: ปรับเป็น .env เมื่อ production)
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    // password: 'kanyaporn',
    database: 'police',
    charset: 'utf8mb4'    // ให้แน่ใจรองรับภาษาไทย
});
db.connect(err => {
    if (err) {
        console.error('Error connecting to MySQL:', err.message);
        process.exit(1);
    } else {
        console.log('Connected to MySQL database');
    }
});

// Login (Demo)
app.post('/api/login', (req, res) => {
    const { name } = req.body;
    if (!name || name.trim() === '') {
        return res.status(400).json({ success: false, message: 'กรุณากรอกชื่อผู้ใช้' });
    }
    res.json({ success: true });
});

// หน้าแรก login
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'login.html'));
});

// API: ประวัติการยืม-คืน (และ/หรือ เฉพาะกรณีที่ยืมอยู่)
app.get('/api/case-files/history', (req, res) => {
    let { officer, onlyBorrowed } = req.query;
    let sql = `
      SELECT case_number, suspect, investigator, officer, status, borrow_timestamp, return_timestamp
      FROM case_files
    `;
    const conditions = [];
    const params = [];
    if (officer) {
        conditions.push('officer = ?');
        params.push(officer);
    }
    if (onlyBorrowed === '1' || onlyBorrowed === 'true') {
        conditions.push("status = 'borrowed'");
    }
    if (conditions.length) {
        sql += ' WHERE ' + conditions.join(' AND ');
    }
    sql += " ORDER BY borrow_timestamp DESC";

    db.query(sql, params, (err, results) => {
        if (err) {
            console.error('MySQL query error:', err.message);
            return res.status(500).json({ success: false, error: err.message });
        }
        const mappedResults = results.map(row => ({
            caseNumber: row.case_number,
            suspect: row.suspect,
            investigator: row.investigator,
            officer: row.officer,
            status: row.status,
            timestamp: row.borrow_timestamp,
            returnedAt: row.return_timestamp || null
        }));
        res.json({ success: true, data: mappedResults });
    });
});

// API: ยืมสำนวน
app.post('/api/case-files/borrow', (req, res) => {
    const { caseNumber, suspect, investigator, officer } = req.body;
    if (!caseNumber || !suspect || !investigator || !officer) {
        return res.status(400).json({ success: false, message: 'ระบุข้อมูลให้ครบทุกฟิลด์' });
    }
    // ตรวจสอบว่ายังไม่มีการ borrow ซ้ำอยู่
    db.query(
        "SELECT * FROM case_files WHERE case_number = ? AND status = 'borrowed'",
        [caseNumber],
        (err, results) => {
            if (err) return res.status(500).json({ success: false, message: err.message });
            if (results.length > 0) return res.status(400).json({ success: false, message: 'สำนวนนี้ถูกยืมอยู่แล้ว' });
            // insert
            db.query(
                `INSERT INTO case_files (case_number, suspect, investigator, officer, status, borrow_timestamp)
                 VALUES (?, ?, ?, ?, 'borrowed', NOW())`,
                [caseNumber, suspect, investigator, officer],
                (err, result) => {
                    if (err) return res.status(500).json({ success: false, message: err.message });
                    res.json({ success: true });
                }
            );
        }
    );
});

// API: คืนสำนวน
app.post('/api/case-files/return', (req, res) => {
    const { caseNumber } = req.body;
    if (!caseNumber) return res.status(400).json({ success: false, message: 'ระบุเลขสำนวนที่คืน' });
    // update เฉพาะรายการที่ borrowed
    db.query(
        `UPDATE case_files SET status = 'returned', return_timestamp = NOW()
         WHERE case_number = ? AND status = 'borrowed'`,
        [caseNumber],
        (err, result) => {
            if (err) return res.status(500).json({ success: false, message: err.message });
            if (result.affectedRows === 0) return res.status(404).json({ success: false, message: 'ไม่พบสำนวนที่กำลังยืม' });
            res.json({ success: true });
        }
    );
});

// Error handler กลาง
app.use((err, req, res, next) => {
    console.error('Express error:', err);
    res.status(500).json({ success: false, error: err.message });
});

// Start
app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
