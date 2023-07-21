import { Request, Response } from "express";
import { writeFileSync } from "fs";

export async function receiveMessage(req: Request, res: Response) {
  //Save file for later processing
  try {
    let dateTime = new Date().toJSON();

    writeFileSync(
      `./messages/${dateTime.replaceAll(":", "-")}.json`,
      JSON.stringify(req.body)
    );
    return res.status(200);
  } catch (error) {
    console.log(error);
  }
}
