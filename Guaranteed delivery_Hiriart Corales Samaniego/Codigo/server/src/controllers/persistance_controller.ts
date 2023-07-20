import { Message } from "src/interfaces";
import { writeFile } from "fs";

export async function saveMessage(message: Message) {
  let currentTime = new Date().toJSON();
  //Save message in file with current time and date
  writeFile(`./messages/${currentTime}`, JSON.stringify(message), null);
  return;
}
