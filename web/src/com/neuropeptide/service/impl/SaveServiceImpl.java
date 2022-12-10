package com.neuropeptide.service.impl;

import com.neuropeptide.dao.ISaveDAO;
import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.SubTab;
import com.neuropeptide.service.ISaveService;

public class SaveServiceImpl implements ISaveService {
    private ISaveDAO saveDAO;

    public SaveServiceImpl() {
    }

    public ISaveDAO getSaveDAO() {
        return this.saveDAO;
    }

    public void setSaveDAO(ISaveDAO saveDAO) {
        this.saveDAO = saveDAO;
    }

    public void saveSubmission(SubTab submission) {
        this.saveDAO.saveSubmission(submission);
    }

    public void saveApproval(NPTab approval) {
        this.saveDAO.saveApproval(approval);
    }
}
