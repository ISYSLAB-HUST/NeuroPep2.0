package com.neuropeptide.tools;

import java.util.Random;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:03
 * @Description:
 */
public class RandomString {
    public RandomString() {
    }

    public String produceRandomString() {
        String radStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuffer generateRandStr = new StringBuffer();
        Random rand = new Random();
        int length = 32;

        for (int i = 0; i < length; ++i) {
            int randNum = rand.nextInt(36);
            generateRandStr.append(radStr.substring(randNum, randNum + 1));
        }

        return generateRandStr.toString();
    }

    public static void main(String[] args) {
        RandomString s = new RandomString();
        s.produceRandomString();
    }
}