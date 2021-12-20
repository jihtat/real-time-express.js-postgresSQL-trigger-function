import express, { Application } from "express";
import { config } from "dotenv";

config();
const app: Application = express();
const PORT = Number(process.env.PORT) || 3000;

app.listen(PORT, async () => {
  console.log(` Server: Running on port ${PORT}`);
});
