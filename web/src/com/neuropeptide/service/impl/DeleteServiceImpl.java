package com.neuropeptide.service.impl;

import com.neuropeptide.dao.IDeleteDAO;
import com.neuropeptide.service.IDeleteService;

public class DeleteServiceImpl implements IDeleteService {
    private IDeleteDAO deleteDAO;

    public DeleteServiceImpl() {
    }

    public IDeleteDAO getDeleteDAO() {
        return this.deleteDAO;
    }

    public void setDeleteDAO(IDeleteDAO deleteDAO) {
        this.deleteDAO = deleteDAO;
    }

    public void delete(String hql) {
        this.deleteDAO.delete(hql);
    }
}

