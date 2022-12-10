package com.neuropeptide.service.impl;

import com.neuropeptide.dao.INPBasicDao;
import com.neuropeptide.tools.ProteinUtilities;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SiteInfoService {
    private static final Logger log = Logger.getLogger("SiteInfoService");
    @Autowired
    INPBasicDao npBasicDao;
    public static List<List<?>> familyDistribution = null;
    public static List<List<?>> phylaDistribution = null;
    public static List<Integer> aminoAcidsDistribution = null;
    public static Map<String, Object> lengthDistribution = null;
    public static Map<String, List<List<Object>>> organismDistribution = null;
    public static List<List<?>> sourceDistribution = null;

    public SiteInfoService() {
    }

    public List<List<?>> getFamilyDistribution() {
        return familyDistribution == null ? (familyDistribution = this.generateFamilyDistribution()) : familyDistribution;
    }

    public List<List<?>> getSourceDistribution() {
        return sourceDistribution == null ? (sourceDistribution = this.generateSourceDistribution()) : sourceDistribution;
    }

    public List<List<?>> getPhylaDistribution() {
        return phylaDistribution == null ? (phylaDistribution = this.generatePhylaDistribution()) : phylaDistribution;
    }

    public List<Integer> getAminoAcidsDistribution() {
        return aminoAcidsDistribution == null ? (aminoAcidsDistribution = this.generateAADistribution()) : aminoAcidsDistribution;
    }

    public Map<String, Object> getLengthDistribution() {
        return lengthDistribution == null ? (lengthDistribution = this.generateLengthDistr()) : lengthDistribution;
    }

    public Map<String, List<List<Object>>> getOrganismDistribution() {
        return organismDistribution == null ? (organismDistribution = this.generateOrganismDistribution()) : organismDistribution;
    }

    @Transactional
    private List<List<?>> generateFamilyDistribution() {
        long othersCount = 0L;
        long total = this.npBasicDao.getNumsOfPeptides();
        List<List<?>> familyQuantity = this.npBasicDao.getFamilyAndQuantity();
        List<List<?>> result = new ArrayList();
        List others = new ArrayList();
        new ArrayList();
        Iterator var10 = familyQuantity.iterator();

        while (var10.hasNext()) {
            List family = (List) var10.next();
            if (!family.get(0).equals("no-family")) {
                if ((double) (Long) family.get(1) / (double) total > 0.01D) {
                    result.add(family);
                } else {
                    othersCount += (Long) family.get(1);
                }
            }
        }

        others.add("others");
        others.add(othersCount);
        result.add(others);
        System.out.println(result);
        return result;
    }

    @Transactional
    private List<List<?>> generateSourceDistribution() {
        List<List<?>> sourceDis = this.npBasicDao.getSourceAndQuantity();
        long literatureNum = 0L;
        long UniProtNum = 0L;
        long NeuroPediaNum = 0L;
        Iterator var9 = sourceDis.iterator();

        while (true) {
            while (true) {
                while (var9.hasNext()) {
                    List source = (List) var9.next();
                    if (!source.get(0).equals("A") && !source.get(0).equals("F") && !source.get(0).equals("SPA") && !source.get(0).equals("SPF")) {
                        if (!source.get(0).equals("SPN") && !source.get(0).equals("SPL")) {
                            UniProtNum += (Long) source.get(1);
                        } else {
                            NeuroPediaNum += (Long) source.get(1);
                        }
                    } else {
                        literatureNum += (Long) source.get(1);
                    }
                }

                List<List<?>> result = new ArrayList();
                List literatureDis = new ArrayList();
                literatureDis.add("Scientific literature");
                literatureDis.add(literatureNum);
                List UniProtDis = new ArrayList();
                UniProtDis.add("UniProt");
                UniProtDis.add(UniProtNum);
                List NeuroPediaDis = new ArrayList();
                NeuroPediaDis.add("NeuroPedia and database <br/> www.neuropeptides.nl");
                NeuroPediaDis.add(NeuroPediaNum);
                result.add(literatureDis);
                result.add(UniProtDis);
                result.add(NeuroPediaDis);
                return result;
            }
        }
    }

    @Transactional
    private List<Integer> generateAADistribution() {
        new DecimalFormat("#0.##");
        Set<Character> aminoAcidType = new HashSet();
        String rawAminoAcidType = "AQLSREKTNGMWDHFYCIVP";

        for (int i = 0; i < rawAminoAcidType.length(); ++i) {
            aminoAcidType.add(rawAminoAcidType.charAt(i));
        }

        List<String> sequences = this.npBasicDao.getAllUniqueSequence();
        int[] aa = new int[rawAminoAcidType.length()];
        Map<Character, Integer> aaMap = new TreeMap();
        Iterator var8 = sequences.iterator();

        while (var8.hasNext()) {
            String sequence = (String) var8.next();
            String seq = ProteinUtilities.getPureSequence(sequence);

            for (int i = 0; i < seq.length(); ++i) {
                Character aminoAcid = seq.charAt(i);
                if (!aminoAcidType.contains(aminoAcid)) {
                    log.error("氨基酸序列包含非法氨基酸 :" + seq + " " + aminoAcid);
                } else if (aaMap.containsKey(aminoAcid)) {
                    aaMap.put(aminoAcid, (Integer) aaMap.get(aminoAcid) + 1);
                } else {
                    aaMap.put(aminoAcid, 1);
                }
            }
        }

        System.out.println(aaMap.values());
        List<Integer> result = new ArrayList();
        result.addAll(aaMap.values());
        return result;
    }

    /**
     * @deprecated
     */
    @Deprecated
    @Transactional
    private Map<String, int[]> generateAminoAcidsDistribution() {
        new DecimalFormat("#0.##");
        Set<Character> aminoAcidType = new HashSet();
        String rawAminoAcidType = "AQLSREKTNGMWDHFYCIVP";

        for (int i = 0; i < rawAminoAcidType.length(); ++i) {
            aminoAcidType.add(rawAminoAcidType.charAt(i));
        }

        List<List<String>> sequences = this.npBasicDao.getAllSequence();
        int[] aaOfVertebrate = new int[rawAminoAcidType.length()];
        int[] aaOfInvertebrate = new int[rawAminoAcidType.length()];
        Map<Character, Integer> aaOfVertebrateMap = new TreeMap();
        Map<Character, Integer> aaOfInVertebrateMap = new TreeMap();
        Iterator var10 = sequences.iterator();

        while (true) {
            while (var10.hasNext()) {
                List<String> sequence = (List) var10.next();
                String seq = ProteinUtilities.getPureSequence((String) sequence.get(0));
                int i;
                Character aminoAcid;
                if (sequence.get(1) != null && ((String) sequence.get(1)).equals("Vertebrate")) {
                    for (i = 0; i < seq.length(); ++i) {
                        aminoAcid = seq.charAt(i);
                        if (!aminoAcidType.contains(aminoAcid)) {
                            log.error("氨基酸序列包含非法氨基酸 :" + seq + " " + aminoAcid);
                        } else if (aaOfVertebrateMap.containsKey(aminoAcid)) {
                            aaOfVertebrateMap.put(aminoAcid, (Integer) aaOfVertebrateMap.get(aminoAcid) + 1);
                        } else {
                            aaOfVertebrateMap.put(aminoAcid, 1);
                        }
                    }
                } else if (sequence.get(1) != null && ((String) sequence.get(1)).equals("invertebrate")) {
                    for (i = 0; i < seq.length(); ++i) {
                        aminoAcid = seq.charAt(i);
                        if (!aminoAcidType.contains(aminoAcid)) {
                            log.error("氨基酸序列包含非法氨基酸 :" + seq + " " + aminoAcid);
                        } else if (aaOfInVertebrateMap.containsKey(aminoAcid)) {
                            aaOfInVertebrateMap.put(aminoAcid, (Integer) aaOfInVertebrateMap.get(aminoAcid) + 1);
                        } else {
                            aaOfInVertebrateMap.put(aminoAcid, 1);
                        }
                    }
                }
            }

            int i = 0;

            int value;
            Iterator var18;
            for (var18 = aaOfVertebrateMap.values().iterator(); var18.hasNext(); aaOfVertebrate[i++] = value) {
                value = (Integer) var18.next();
            }

            i = 0;

            for (var18 = aaOfInVertebrateMap.values().iterator(); var18.hasNext(); aaOfInvertebrate[i++] = value) {
                value = (Integer) var18.next();
            }

            Map<String, int[]> result = new HashMap();
            result.put("vertebrate", aaOfVertebrate);
            result.put("invertebrate", aaOfInvertebrate);
            return result;
        }
    }

    @Transactional
    private Map<String, Object> generateLengthDistr() {
        DecimalFormat df = new DecimalFormat("#0.###");
        List<Object[]> sequences = this.npBasicDao.getLengthAndORType();
        List<String> lengthCategroy = new ArrayList();
        lengthCategroy.add("<10");
        lengthCategroy.add("11-20");
        lengthCategroy.add("21-30");
        lengthCategroy.add("31-40");
        lengthCategroy.add("41-50");
        lengthCategroy.add("51-60");
        lengthCategroy.add("61-70");
        lengthCategroy.add("71-80");
        lengthCategroy.add("81-90");
        lengthCategroy.add("91-100");
        lengthCategroy.add(">100");
        int[] countOfEachLength = new int[lengthCategroy.size()];
        double[] percentOfEachLength = new double[lengthCategroy.size()];
        Iterator var7 = sequences.iterator();

        int i;
        while (var7.hasNext()) {
            Object[] seq = (Object[]) var7.next();
            i = (Integer) seq[1];
            if (i > 100) {
                int var10002 = countOfEachLength[10]++;
            } else {
                ++countOfEachLength[(i - 1) / 10];
            }
        }

        double total = (double) sequences.size();

        for (i = 0; i < countOfEachLength.length; ++i) {
            percentOfEachLength[i] = Double.parseDouble(df.format((double) countOfEachLength[i] / total));
        }

        Map<String, Object> result = new HashMap();
        Map<String, double[]> series = new HashMap();
        series.put("", percentOfEachLength);
        result.put("category", lengthCategroy);
        result.put("series", series);
        return result;
    }

    /**
     * @deprecated
     */
    @Deprecated
    @Transactional
    private Map<String, Object> generateLengthDistribution() {
        DecimalFormat df = new DecimalFormat("#0.###");
        List<Object[]> sequences = this.npBasicDao.getLengthAndORType();
        List<String> lengthCategroy = new ArrayList();
        lengthCategroy.add("<5");
        lengthCategroy.add("5-10");
        lengthCategroy.add("10-15");
        lengthCategroy.add("15-20");
        lengthCategroy.add("20-25");
        lengthCategroy.add("25-30");
        lengthCategroy.add("30-35");
        lengthCategroy.add("35-40");
        lengthCategroy.add("40-45");
        lengthCategroy.add("45-50");
        lengthCategroy.add(">=50");
        int[] lengthOfVertebrate = new int[lengthCategroy.size()];
        int[] lengthOfInvertebrate = new int[lengthCategroy.size()];
        double[] lengthOfVertebratePercent = new double[lengthCategroy.size()];
        double[] lengthOfInvertebratePercent = new double[lengthCategroy.size()];
        double totalLengthOfVertebrate = 0.0D;
        double totalLengthOfInvertebrate = 0.0D;

        for (int i = 0; i < lengthOfVertebrate.length; ++i) {
            lengthOfVertebratePercent[i] = Double.parseDouble(df.format((double) lengthOfVertebrate[i] / totalLengthOfVertebrate));
            lengthOfInvertebratePercent[i] = Double.parseDouble(df.format((double) lengthOfInvertebrate[i] / totalLengthOfInvertebrate));
        }

        Map<String, Object> result = new HashMap();
        Map<String, double[]> series = new HashMap();
        series.put("vertebrate", lengthOfVertebratePercent);
        series.put("invertebrate", lengthOfInvertebratePercent);
        result.put("category", lengthCategroy);
        result.put("series", series);
        return result;
    }

    @Transactional
    private Map<String, List<List<Object>>> generateOrganismDistribution() {
        return this.npBasicDao.getOrganismAndORType();
    }

    private List<List<?>> generatePhylaDistribution() {
        return this.npBasicDao.getPhylaAndQuantity();
    }
}

