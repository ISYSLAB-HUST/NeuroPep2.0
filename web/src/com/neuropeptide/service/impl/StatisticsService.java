package com.neuropeptide.service.impl;

import com.neuropeptide.dao.INPBasicDao;
import com.neuropeptide.service.IStatisticsService;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StatisticsService implements IStatisticsService {
    @Autowired
    INPBasicDao npBasicDao;
    @Autowired
    SiteInfoService siteInfoService;

    public StatisticsService() {
    }

    @Transactional
    public List<Integer> getAminoAcidsDistribution() {
        return this.siteInfoService.getAminoAcidsDistribution();
    }

    @Transactional
    public List<List<?>> getFamilyDistribution() {
        return this.siteInfoService.getFamilyDistribution();
    }

    @Transactional
    public List<List<?>> getOrganismDistribution() {
        long othersCount = 0L;
        long total = this.npBasicDao.getNumsOfPeptides();
        List<List<?>> organismQuantity = this.npBasicDao.getOrganismAndQuantity();
        List<List<?>> result = new ArrayList();
        List others = new ArrayList();
        List unknown = new ArrayList();
        Iterator var10 = organismQuantity.iterator();

        while (var10.hasNext()) {
            List organism = (List) var10.next();
            if (organism.get(0).equals("unknown")) {
                unknown = organism;
            } else if ((double) (Long) organism.get(1) / (double) total > 0.01D) {
                result.add(organism);
            } else {
                othersCount += (Long) organism.get(1);
            }
        }

        others.add("others");
        others.add(othersCount);
        result.add(others);
        result.add(unknown);
        System.out.println(result);
        return result;
    }

    @Transactional
    public List<List<?>> getPhylaDistribution() {
        return this.siteInfoService.getPhylaDistribution();
    }

    @Transactional
    public List<List<?>> getSourceDistribution() {
        return this.siteInfoService.getSourceDistribution();
    }
}
