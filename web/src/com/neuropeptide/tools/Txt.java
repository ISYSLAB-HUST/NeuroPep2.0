package com.neuropeptide.tools;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:05
 * @Description:
 */
public class Txt {
    public Txt() {
    }

    public static void ReadData() throws IOException {
        File file = new File("D:/Test.txt");
        BufferedWriter writer = new BufferedWriter(new FileWriter(file));

        try {
            FileReader read = new FileReader("D:/predictions.txt");
            BufferedReader br = new BufferedReader(read);
            String row = "";
            int i = 1;
            int len = 0;

            String temp;
            while ((temp = br.readLine()) != null) {
                ++len;
                if (i == 1024) {
                    i = 0;
                    writer.write(row);
                    writer.write("\n");
                    row = "";
                    if (temp.indexOf("-") == 0) {
                        row = row + "- ";
                        i = i + 1;
                    } else {
                        row = row + "+ ";
                        i = i + 1;
                    }
                } else if (temp.indexOf("-") == 0) {
                    row = row + "- ";
                    ++i;
                } else {
                    row = row + "+ ";
                    ++i;
                }
            }

            System.out.println(len);
            writer.flush();
            br.close();
            writer.close();
        } catch (FileNotFoundException var8) {
            var8.printStackTrace();
        } catch (IOException var9) {
            var9.printStackTrace();
        }

    }

    public static void main(String[] args) throws IOException {
        SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd_hh:mm:ss");
        String date = sDateFormat.format(new Date());
        System.out.println(date);
    }
}
