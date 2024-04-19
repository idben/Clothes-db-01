import mysql from "mysql2/promise";

const db = await mysql.createPool({
  host: '127.0.0.1',
  port: 8086,
  user: 'admin',
  password: "a12345",
  database: 'Clothes',
  waitForConnections: true,
  connectionLimit: 5,
  queueLimit: 0
});

export default db;