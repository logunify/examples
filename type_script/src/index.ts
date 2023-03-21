import LogUnifyLogger from "@logunify/node-sdk";
import { v4 as uuidv4 } from 'uuid';
import { ButtonType, Event, Surface, UserActivity } from "./generated/UserActivity";

LogUnifyLogger.setup({
    apiKey: "api_key_1",
    receiverURL: "http://localhost:8081/api/events/_bulk",
    enableDebugLog: true,
})
const userId = "uid";
const sessionId = uuidv4();

UserActivity.fromObject({
    user_id: userId,
    surface: Surface.SCREEN_1,
    button_type: ButtonType.NEXT,
    event: Event.IMPRESSION,
    session_id: sessionId,
    string_array: ['str1', 'str2'],
    int_array: [1, 2],
    string_int_map: {
        str1: 1,
        str2: 2
    }
}).log();

// After click
UserActivity.fromObject({
    user_id: userId,
    surface: Surface.SCREEN_1,
    button_type: ButtonType.NEXT,
    event: Event.CLICK,
    session_id: sessionId,
    string_array: ['str1', 'str2'],
    int_array: [1, 2],
    string_int_map: {
        str1: 1,
        str2: 2
    }
}).log();
