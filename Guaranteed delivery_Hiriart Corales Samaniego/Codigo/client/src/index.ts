import express, { Request, Response } from "express";

import router from "./routes";

const app = express();
const port = process.env.PORT || 4000;

app.use(express.json());
app.use(express.urlencoded());

// Root URL is /client
app.use("/client", router);

// If route not found
app.use((req: Request, res: Response) => {
  return res.sendStatus(404);
});

app.listen(port, async () => {
  console.log(`Running on: http://localhost:${port}`);
});
