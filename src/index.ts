import express, { Application } from "express";
import { config } from "dotenv";

import { Client } from "pg";
config();
const app: Application = express();
const PORT = Number(process.env.PORT) || 3000;

const client = new Client({
  connectionString: process.env.DB_URL,
});
client.connect();

client.query("Listen out_of_stock_notif");
client.on("notification", async (data: any) => {
  console.log(data);
});
app.listen(PORT, async () => {
  console.log(` Server: Running on port ${PORT}`);
});
