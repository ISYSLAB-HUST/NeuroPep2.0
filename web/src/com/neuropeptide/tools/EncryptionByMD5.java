package com.neuropeptide.tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:58
 * @Description:
 */
public class EncryptionByMD5 {
    public EncryptionByMD5() {
    }

    public static String getMD5(byte[] source) {
        String s = null;
        char[] hexDigits = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(source);
            byte[] tmp = md.digest();
            char[] str = new char[32];
            int k = 0;

            for (int i = 0; i < 16; ++i) {
                byte byte0 = tmp[i];
                str[k++] = hexDigits[byte0 >>> 4 & 15];
                str[k++] = hexDigits[byte0 & 15];
            }

            s = new String(str);
        } catch (NoSuchAlgorithmException var9) {
            var9.printStackTrace();
        }

        return s;
    }

    public static void main(String[] args) {
        String test = getMD5("test".getBytes());
        System.out.println(test);
    }
}
