package com.neuropeptide.service.impl;

import com.neuropeptide.dao.INPBasicDao;
import com.neuropeptide.dao.INPGenerateDao;
import com.neuropeptide.entity.FamilyTab;
import com.neuropeptide.entity.NPTab;
import com.neuropeptide.service.INPGenerateService;
import com.neuropeptide.tools.ProteinUtilities;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("NPGenerateService")
public class NPGenerateService implements INPGenerateService {
    @Autowired
    INPBasicDao npBasicDao;
    @Autowired
    INPGenerateDao npGenerateDao;

    public NPGenerateService() {
    }

    @Transactional
    public Map<String, String> generateAllField() {
        ProteinUtilities proteinUtil = new ProteinUtilities();
        List<NPTab> nps = this.npBasicDao.getAllInNPTab();
        Iterator var4 = nps.iterator();

        while (var4.hasNext()) {
            NPTab npTab = (NPTab) var4.next();
            String pureSequence = ProteinUtilities.getPureSequence(npTab.getSequence());
            this.npGenerateDao.updateAllFieldById(npTab.getId(), pureSequence.length(), proteinUtil.getProteinMW(pureSequence), proteinUtil.getProteinPI(pureSequence), proteinUtil.getPMID(npTab.getPeptide_REF()));
        }

        System.out.println("length,MW,PI update successfully.");
        Map<String, String> result = new HashedMap();
        result.put("result", "SUCCESS");
        return result;
    }

    @Transactional
    public void generateLengthField() {
        List<NPTab> nps = this.npBasicDao.getAllInNPTab();
        Iterator var3 = nps.iterator();

        while (var3.hasNext()) {
            NPTab npTab = (NPTab) var3.next();
            this.npGenerateDao.updateLengthById(npTab.getId(), npTab.getSequence().length());
        }

        System.out.println("sequence length update successfully.");
    }

    public void generateMWField() {
    }

    public void generatePIField() {
    }

    private int getSequenceLength(String sequence) {
        return 0;
    }

    @Transactional
    public void generateFamilyTab() {
        BufferedReader br = null;

        try {
            br = new BufferedReader(new FileReader(new File("E:\\Users\\sanween\\Desktop\\familyAbbr.csv")));
            String line = "";
            HashedMap pairs = new HashedMap();

            while ((line = br.readLine()) != null) {
                String[] pair = line.split(",");
                pairs.put(pair[1].trim(), pair[0].trim());
            }

            List<String> familys = this.npBasicDao.getAllFamily();

            FamilyTab record;
            for (Iterator var6 = familys.iterator(); var6.hasNext(); this.npGenerateDao.insertRecordToFamilyTab(record)) {
                String family = (String) var6.next();
                record = new FamilyTab();
                record.setFamilyName(family);
                if (pairs.containsKey(family)) {
                    record.setFamilyNameAbbr((String) pairs.get(family));
                }
            }
        } catch (FileNotFoundException var18) {
            var18.printStackTrace();
            System.out.println("File is not found");
        } catch (IOException var19) {
            var19.printStackTrace();
            System.out.println("fail while reading file");
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException var17) {
                    var17.printStackTrace();
                    System.out.println("fail to close file.");
                }
            }

        }

    }
}
