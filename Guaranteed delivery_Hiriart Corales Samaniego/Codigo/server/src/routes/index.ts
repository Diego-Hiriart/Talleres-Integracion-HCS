import express from "express";
import { sendNewMessage, resendFailedMessages } from "src/controllers/messages_controller";

const router = express.Router();

router.post("/send/send-new", sendNewMessage);
router.post("/send/resend-failed", resendFailedMessages);

export default router;
