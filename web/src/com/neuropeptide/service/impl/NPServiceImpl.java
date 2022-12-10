package com.neuropeptide.service.impl;

import com.neuropeptide.dao.INPServiceDAO;
import com.neuropeptide.entity.NPTab;
import com.neuropeptide.service.INPService;

public class NPServiceImpl implements INPService {
    private INPServiceDAO serviceDAO;

    public NPServiceImpl() {
    }

    public INPServiceDAO getServiceDAO() {
        return this.serviceDAO;
    }

    public void setServiceDAO(INPServiceDAO serviceDAO) {
        this.serviceDAO = serviceDAO;
    }

    public String getInfos() {
        return this.serviceDAO.getInfos();
    }

    public NPTab getInfo_id(String id) {
        return this.serviceDAO.getInfo_id(id);
    }

    public NPTab getInfo_num(String accessNum) {
        return this.serviceDAO.getInfo_num(accessNum);
    }

    public String getInfo_name(String name) {
        return this.serviceDAO.getInfo_name(name);
    }

    public String getInfo_seq(String sequence) {
        return this.serviceDAO.getInfo_seq(sequence);
    }

    public String getNeuropepName(String name) {
        return this.serviceDAO.getNeuropepName(name);
    }

    public String getNeuropepSeq(String sequence) {
        return this.serviceDAO.getNeuropepSeq(sequence);
    }

    public void saveOrUpdateInfo(NPTab info) {
    }

    public void deleteInfo(String id) {
    }
}

