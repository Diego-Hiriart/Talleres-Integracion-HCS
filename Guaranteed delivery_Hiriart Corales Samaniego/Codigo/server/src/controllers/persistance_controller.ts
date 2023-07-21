import { Message } from "../interfaces";
import { writeFile } from "fs";

export async function saveMessage(message: Message) {
  console.log(JSON.stringify(message));
  let currentTime = new Date().toJSON();
  console.log(`${currentTime.replaceAll(":", "-")}.json`);
  //Save message in file with current time and date
  writeFile(
    `./messages/${currentTime.replaceAll(":", "-")}.json`,
    JSON.stringify(message),
    (error) => {
      if (error) {
        console.log("error saving");
      }
    }
  );
  return;
}
