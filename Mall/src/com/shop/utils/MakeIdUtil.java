package com.shop.utils;
import java.util.UUID;

public class MakeIdUtil {
    public static String makeID(){
        return UUID.randomUUID().toString();
    }
}
