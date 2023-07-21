import { Request, Response } from "express";
import * as fs from "fs";
import { Message } from "../interfaces";
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
  return res.sendStatus(200);
}

type Content = { body: number };

export async function resendFailedMessages(req: Request, res: Response) {
  const sentMessages: Content[] = [];
  const failedMessages: Content[] = [];
  const files = fs.readdirSync("./messages");

  await Promise.all(
    files.map(async (file) => {
      console.log(file);

      const message: Content = JSON.parse(
        fs.readFileSync(`./messages/${file}`).toString()
      );
      try {
        const result = await fetch("http://localhost:4000/client/receiver", {
          method: "POST",
          body: JSON.stringify(message.body),
        });

        if (result.ok) {
          //Delete stored message if successfully received by client
          fs.unlinkSync(file);
          sentMessages.push(message);
        }
      } catch (error) {
        failedMessages.push(message);
      }
    })
  );

  return res
    .status(200)
    .json({ sentMessages: sentMessages, failedMessages: failedMessages });
}
