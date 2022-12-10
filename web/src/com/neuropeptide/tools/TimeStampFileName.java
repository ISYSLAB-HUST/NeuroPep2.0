package com.neuropeptide.tools;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:04
 * @Description:
 */
public class TimeStampFileName {
    private static SimpleDateFormat sdf = null;

    public TimeStampFileName() {
    }

    public static String getIPTimeRandName() {
        StringBuffer buf = new StringBuffer();
        buf.append(getTimeStamp() + "-");
        Random random = new Random();

        for (int i = 0; i < 3; ++i) {
            buf.append(random.nextInt(10));
        }

        return buf.toString();
    }

    private String addZero(String str, int len) {
        StringBuffer s = new StringBuffer();
        s.append(str);

        while (s.length() < len) {
            s.insert(0, "0");
        }

        return s.toString();
    }

    private static String getTimeStamp() {
        sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
        return sdf.format(new Date());
    }
}
