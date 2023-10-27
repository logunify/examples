package com.logunify.android_logging_test_app;

import java.util.UUID;

public class SessionManager {
    private static String session_id;

    public static void generateNewSession() {
        session_id = UUID.randomUUID().toString();
    }

    public static String getSessionID(){
        return session_id;
    }
}
