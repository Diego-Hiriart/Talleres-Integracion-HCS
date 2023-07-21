import { Router } from "express";

import { receiveMessage } from "../controllers/messages_controller";

const router = Router();

router.post("/receiver", receiveMessage);

export default router;
