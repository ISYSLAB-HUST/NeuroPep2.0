package com.neuropeptide.tools;

import java.text.DecimalFormat;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:03
 * @Description:
 */
public class ProteinUtilities {
    DecimalFormat df = new DecimalFormat("#.000");

    public ProteinUtilities() {
    }

    public float getProteinMW(String sequence) {
        float score = 0.0F;

        for (int i = 0; i < sequence.length(); ++i) {
            switch (sequence.charAt(i)) {
                case 'A':
                    score = (float) ((double) score + 71.037114D);
                case 'B':
                case 'J':
                case 'X':
                default:
                    break;
                case 'C':
                    score = (float) ((double) score + 103.009185D);
                    break;
                case 'D':
                    score = (float) ((double) score + 115.026943D);
                    break;
                case 'E':
                    score = (float) ((double) score + 129.042593D);
                    break;
                case 'F':
                    score = (float) ((double) score + 147.068414D);
                    break;
                case 'G':
                    score = (float) ((double) score + 57.021464D);
                    break;
                case 'H':
                    score = (float) ((double) score + 137.058912D);
                    break;
                case 'I':
                    score = (float) ((double) score + 113.084064D);
                    break;
                case 'K':
                    score = (float) ((double) score + 128.094963D);
                    break;
                case 'L':
                    score = (float) ((double) score + 113.084064D);
                    break;
                case 'M':
                    score = (float) ((double) score + 131.040485D);
                    break;
                case 'N':
                    score = (float) ((double) score + 114.042927D);
                    break;
                case 'O':
                    score = (float) ((double) score + 237.14772D);
                    break;
                case 'P':
                    score = (float) ((double) score + 97.052764D);
                    break;
                case 'Q':
                    score = (float) ((double) score + 128.058578D);
                    break;
                case 'R':
                    score = (float) ((double) score + 156.101111D);
                    break;
                case 'S':
                    score = (float) ((double) score + 87.032028D);
                    break;
                case 'T':
                    score = (float) ((double) score + 101.047679D);
                    break;
                case 'U':
                    score = (float) ((double) score + 150.95363D);
                    break;
                case 'V':
                    score = (float) ((double) score + 99.068414D);
                    break;
                case 'W':
                    score = (float) ((double) score + 186.079313D);
                    break;
                case 'Y':
                    score = (float) ((double) score + 163.06332D);
            }
        }

        score = (float) ((double) score + 1.0079D);
        score = (float) ((double) score + 17.0073D);
        return Float.parseFloat(this.df.format((double) score));
    }

    public float getProteinPI(String sequence) {
        return Float.parseFloat(this.df.format(PICompute.computePI(sequence.toCharArray())));
    }

    public static String getPureSequence(String sequence) {
        if (sequence.indexOf(40) >= 0) {
            sequence = sequence.replaceAll("\\([^\\(\\)]*\\)", "");
        }

        if (sequence.indexOf(47) >= 0) {
            sequence = sequence.replaceAll("\\/\\w{1}", "");
        }

        return sequence;
    }

    public String getPMID(String ref) {
        String pmid = "";
        if (ref == null) {
            return pmid;
        } else {
            String[] refs = ref.split("\\$");
            String[] var7 = refs;
            int var6 = refs.length;

            for (int var5 = 0; var5 < var6; ++var5) {
                String aref = var7[var5];
                pmid = pmid + aref.split("#")[0].trim() + ",";
            }

            pmid = pmid.substring(0, pmid.length() - 1);
            return pmid;
        }
    }
}
