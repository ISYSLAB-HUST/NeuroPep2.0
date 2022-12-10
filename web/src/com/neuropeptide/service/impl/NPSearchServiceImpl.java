package com.neuropeptide.service.impl;

import com.neuropeptide.dao.INPSearchDAO;
import com.neuropeptide.dao.IReceptorDao;
import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.Receptor;
import com.neuropeptide.service.INPSearchService;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class NPSearchServiceImpl implements INPSearchService {
    private INPSearchDAO searchDAO;

    private IReceptorDao receptorDao;

    public NPSearchServiceImpl() {
    }

    public INPSearchDAO getSearchDAO() {
        return this.searchDAO;
    }

    public void setSearchDAO(INPSearchDAO searchDAO) {
        this.searchDAO = searchDAO;
    }

    public List search(String hql) {
        return this.searchDAO.search(hql);
    }

    public NPTab searchByAccNum(String accessionNum) {
        return this.searchDAO.searchByAccNum(accessionNum);
    }

    public JSONArray searchLenDistr() {
        return this.searchDAO.searchLenDistr();
    }

    public JSONArray searchFamiDistr() {
        return this.searchDAO.searchFamiDistr();
    }

    public JSONArray searchOrgaDistr() {
        return this.searchDAO.searchOrgaDistr();
    }

    public JSONArray searchSourDistr() {
        return this.searchDAO.searchSourDistr();
    }

//    public List<Receptor> getAllReceptors(String receptors) {
//        List<Receptor> result = new ArrayList<>();
//        String[] receptorArr = receptors.split("#");
//        for (String receptor : receptorArr) {
//            result.addAll(receptorDao.listByEntryName(receptor));
//        }
//        return result;
//    }
}

