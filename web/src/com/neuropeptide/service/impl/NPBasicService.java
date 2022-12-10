package com.neuropeptide.service.impl;

import com.neuropeptide.dao.INPBasicDao;
import com.neuropeptide.dao.IReceptorDao;
import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.Receptor;
import com.neuropeptide.entity.ReceptorNew;
import com.neuropeptide.service.INPBasicService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("npBasicService")
public class NPBasicService implements INPBasicService {
    @Autowired
    INPBasicDao npBasicDao;

    @Autowired
    IReceptorDao receptorDao;

    public NPBasicService() {
    }

    @Transactional
    public List<String> getAllFamily() {
        return this.npBasicDao.getAllFamily();
    }

    @Transactional
    public List<String> getAllOrganism() {
        return this.npBasicDao.getAllOrganism();
    }

    //czq
    @Override
    @Transactional
    public List<String> getOrganismByPhyla(String phylaType) {
        return this.npBasicDao.getOrganismByPhyla(phylaType);
    }

    @Transactional
    public List<NPTab> getAllNPByFaimly(String family) {
        return this.npBasicDao.getAllNPByFaimly(family);
    }

    @Transactional
    public List<NPTab> getAllNPByOrganism(String organism) {
        return this.npBasicDao.getAllNPByOrganism(organism);
    }

    @Transactional
    public List<NPTab> getAllNPByModification(String modification) {
        return this.npBasicDao.getAllNPByModification(modification);
    }

    @Transactional
    @Override
    public List<Receptor> getAllReceptors(String receptors) {
        List<Receptor> result = new ArrayList<>();
        String[] receptorArr = receptors.split("#");
        for (String receptor : receptorArr) {
           result.addAll(receptorDao.listByEntryName(receptor));
        }
        return result;
    }

    //add receptor's method
    @Transactional
    public List<String> getAllRecFamily() {
        return this.npBasicDao.getAllRecFamily();
    }

    //add receptor's method
    @Transactional
    public List<String> getAllRecOrganism() {
        return this.npBasicDao.getAllRecOrganism();
    }

    @Transactional
    public List<ReceptorNew> getAllRecByFaimly(String family) {
        return this.npBasicDao.getAllRecByFaimly(family);
    }

    @Transactional
    public List<ReceptorNew> getAllRecyOrganism(String organism) {
        return this.npBasicDao.getAllRecyOrganism(organism);
    }

    @Transactional
    public List<ReceptorNew> getAllRecByModification(String Modification) {
        return this.npBasicDao.getAllRecByModification(Modification);
    }

    @Transactional
    public List<String> getAllPhyla() {

        List<String> plist = this.npBasicDao.getAllPhyla();
        Collections.replaceAll(plist,"NA","Other");
        Collections.sort(plist);
        Collections.swap(plist,8,9);
        return plist;
    }


    //增加通过phyla获取organism
    @Transactional
    public List<String> getAllOrganismByPhyla(String phyla) {
        return this.npBasicDao.getAllOrganismByPhyla(phyla);
    }

    @Transactional
    public List<String> getAllRecPhyla() {
        return this.npBasicDao.getAllRecPhyla();
    }

    @Transactional
    public List<String> getAllOrganismRecByPhyla(String phyla) {
        return this.npBasicDao.getAllOrganismRecByPhyla(phyla);
    }


}
