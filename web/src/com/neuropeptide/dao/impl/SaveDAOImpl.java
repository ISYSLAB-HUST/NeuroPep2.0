package com.neuropeptide.dao.impl;

import com.neuropeptide.dao.ISaveDAO;
import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.SubTab;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class SaveDAOImpl extends HibernateDaoSupport implements ISaveDAO {
    public SaveDAOImpl() {
    }

    public void saveSubmission(SubTab submission) {
        this.getHibernateTemplate().save(submission);
    }

    public void saveApproval(NPTab approval) {
        this.getHibernateTemplate().save(approval);
    }
}
