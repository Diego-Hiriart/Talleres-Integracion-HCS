import { Request, Response } from "express";
import { Message } from "src/interfaces";

import * as fs from "fs";

import { saveMessage } from "./persistance_controller";

export async function sendNewMessage(req: Request, res: Response) {
  //Create random number for message
  let randNumber = Math.random();
  //Create message
  let newMessage: Message = { body: randNumber };
  //Send message to client
  const result = await fetch("http://localhost:4000/client/receiver", {
    method: "POST",
    body: JSON.stringify(newMessage.body),
  });
  let messageReceived = false;
  if (result.ok) {
    messageReceived = true;
  } else {
    //Save created message if it was not received
    await saveMessage(newMessage);
  }
  return res.status(200).json(messageReceived);
}

export async function resendFailedMessages(req: Request, res: Response) {
  fs.readdir("./messages", (error, files) => {
    files.forEach(async (file) => {
      //Get stored message
      const storedMessage = JSON.parse(fs.readFileSync(file).toString());
      //Send message to client
      const result = await fetch("http://localhost:4000/client/receiver", {
        method: "POST",
        body: JSON.stringify(storedMessage.body),
      });
      //Delete stored message if successfully received by client
      fs.unlink(file, null);
    });
  });
  return res.status(200);
}
