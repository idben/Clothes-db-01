import express from "express";
import multer from "multer";
import moment from "moment";
import cors from "cors";
import { v4 as uuid } from "uuid";
import db from "./db.mjs";

let whitelist = ["http://localhost:5500", "http://localhost:3000"];
let corsOptions = {
  credentials: true,
  origin(origin, callback) {
    if (!origin || whitelist.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error("不允許傳遞資料!!"));
    }
  },
};

const app = express();
app.use(cors(corsOptions));

app.get("/", (req, res) => {
  res.send("首頁");
});

app.get("/api/clothes/:id", async (req, res) => {
  const id = req.params.id;
  const [results, fields] = await db.execute(
    'SELECT s.ClothID, c.ColorName, sz.SizeName, s.Quantity FROM Stock s JOIN Colors c ON s.ColorID = c.ColorID JOIN Sizes sz ON s.SizeID = sz.SizeID WHERE s.ClothID = ?;',
    [id],
  )
  res.json(results)
});

app.listen(3000, () => {
  console.log("server is running at http://localhost:3000");
});
