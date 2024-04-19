# 衣服類資料庫正規化範例與使用

## 資料庫
1. 在 mysql 中建立 Clothes 資料庫
2. 在 Clothes 中匯入 data 資料夾中的 Clothes.sql

## server 
1. 修改 db.mjs 中的 Database 帳號密碼等資料
```javascript
npm i
```
2. 安裝所需依賴
```javascript
npm run test
```
3. 再執行 server 端程式

## client 
1. 將 client 端的 index.html 用 live server 跑起來
2. 這支程式是將衣服編號 1 的內容抓出來呈現視覺
3. 依照先前詢問的需求，會先選顏色，然後會跳出可以選的尺寸，再選尺寸則會跳出庫存
4. 操作完，再去看看資料表是如何設計的