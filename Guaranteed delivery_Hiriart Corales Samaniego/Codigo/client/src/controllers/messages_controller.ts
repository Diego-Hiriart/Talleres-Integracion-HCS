import { Request, Response } from "express";
import { writeFile } from "fs";
import { Message } from "src/interfaces";

export async function receiveMessage(req: Request, res: Response) {
  //Save file for later processing
  let dateTime = new Date().toJSON();
  writeFile(`./messages/${dateTime}`, req.body, null);
  return res.status(200);
}
