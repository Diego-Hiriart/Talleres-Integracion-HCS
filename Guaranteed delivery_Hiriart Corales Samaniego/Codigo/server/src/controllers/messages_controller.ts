import { Request, Response } from "express";
import { Message } from "../interfaces";

import * as fs from "fs/promises";

import { saveMessage } from "./persistance_controller";

export async function sendNewMessage(req: Request, res: Response) {
  //Create random number for message
  let randNumber = Math.random();
  //Create message
  let newMessage: Message = { body: randNumber };
  //Send message to client
  let messageReceived = false;
  try {
    const result = await fetch("http://localhost:4000/client/receiver", {
      method: "POST",
      body: JSON.stringify(newMessage.body),
    });
    if (result.ok) {
      messageReceived = true;
    } else {
      //Save created message if it was not received
      await saveMessage(newMessage);
    }
  } catch (e) {
    //Save created message if it was not received
    await saveMessage(newMessage);
  }
  return res.status(200).json(messageReceived);
}

export async function resendFailedMessages(req: Request, res: Response) {
  let sentMessages: string[] = [];
  let failedMessages: string[] = [];
  let files = await fs.readdir("./messages");
  files.map(async (file) => {
    try {
      //Get stored message
      let fileContents = await fs.readFile(`./messages/${file}`)
      const storedMessage = JSON.parse(fileContents.toString());
      console.log("1");
      //Send message to client
      const result = await fetch("http://localhost:4000/client/receiver", {
        method: "POST",
        body: JSON.stringify(storedMessage.body),
      });
      if (result.ok) {
        //Delete stored message if successfully received by client
        await fs.unlink(file);
        sentMessages.push(file);
      }
    } catch (e) {
      console.log("2");
      failedMessages.push(file);
    }
  });
  console.log("3");
  return res
    .status(200)
    .json({ sentMessages: sentMessages, failedMessages: failedMessages });
}
