import express from "express";

import { receiveMessage } from "src/controllers/messages_controller";

const router = express.Router();

router.post("/receiver", receiveMessage);

export default router;
