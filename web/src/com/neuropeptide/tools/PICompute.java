package com.neuropeptide.tools;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:01
 * @Description:
 */
public class PICompute {
    public PICompute() {
    }

    public static double computePI(char[] protein) {
        int ProtLength = protein.length;
        char Asp = 68;
        char Glu = 69;
        char Cys = 67;
        char Tyr = 89;
        char His = 72;
        char Lys = 75;
        char Arg = 82;
        int AspNumber = 0;
        int GluNumber = 0;
        int CysNumber = 0;
        int TyrNumber = 0;
        int HisNumber = 0;
        int LysNumber = 0;
        int ArgNumber = 0;
//        int i = 0;

        for (int i = 0; i <= protein.length - 1; ++i) {
            if (protein[i] == Asp) {
                ++AspNumber;
            }

            if (protein[i] == Glu) {
                ++GluNumber;
            }

            if (protein[i] == Cys) {
                ++CysNumber;
            }

            if (protein[i] == Tyr) {
                ++TyrNumber;
            }

            if (protein[i] == His) {
                ++HisNumber;
            }

            if (protein[i] == Lys) {
                ++LysNumber;
            }

            if (protein[i] == Arg) {
                ++ArgNumber;
            }
        }

        double NQ = 0.0D;
        double QN1 = 0.0D;
        double QN2 = 0.0D;
        double QN3 = 0.0D;
        double QN4 = 0.0D;
        double QN5 = 0.0D;
        double QP1 = 0.0D;
        double QP2 = 0.0D;
        double QP3 = 0.0D;
        double QP4 = 0.0D;
        double pH = 6.5D;
        double pHprev = 0.0D;
        double pHnext = 14.0D;
        double X = 0.0D;
        double E = 0.01D;
        double temp = 0.0D;

        do {
            QN1 = -1.0D / (1.0D + Math.pow(10.0D, 3.65D - pH));
            QN2 = (double) (-AspNumber) / (1.0D + Math.pow(10.0D, 3.9D - pH));
            QN3 = (double) (-GluNumber) / (1.0D + Math.pow(10.0D, 4.07D - pH));
            QN4 = (double) (-CysNumber) / (1.0D + Math.pow(10.0D, 8.18D - pH));
            QN5 = (double) (-TyrNumber) / (1.0D + Math.pow(10.0D, 10.46D - pH));
            QP1 = (double) HisNumber / (1.0D + Math.pow(10.0D, pH - 6.04D));
            QP2 = 1.0D / (1.0D + Math.pow(10.0D, pH - 8.2D));
            QP3 = (double) LysNumber / (1.0D + Math.pow(10.0D, pH - 10.54D));
            QP4 = (double) ArgNumber / (1.0D + Math.pow(10.0D, pH - 12.48D));
            NQ = QN1 + QN2 + QN3 + QN4 + QN5 + QP1 + QP2 + QP3 + QP4;
            if (pH >= 14.0D) {
                System.out.println("Something is wrong - pH is higher than 14");
                break;
            }

            if (NQ < 0.0D) {
                temp = pH;
                pH -= (pH - pHprev) / 2.0D;
                pHnext = temp;
                System.out.println("pH: " + pH + ", \tpHnext: " + temp);
            } else {
                temp = pH;
                pH += (pHnext - pH) / 2.0D;
                pHprev = temp;
                System.out.println("pH: " + pH + ", \tpHprev: " + temp);
            }
        } while (pH - pHprev >= E || pHnext - pH >= E);

        System.out.println("Protein isoelectric point:" + pH);
        return pH;
    }
}
