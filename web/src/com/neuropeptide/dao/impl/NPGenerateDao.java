package com.neuropeptide.dao.impl;

import com.neuropeptide.dao.INPGenerateDao;
import com.neuropeptide.entity.FamilyTab;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NPGenerateDao implements INPGenerateDao {
    @Autowired
    SessionFactory sessionFactory;

    public NPGenerateDao() {
    }

    public void updateAllFieldById(int id, int length, float MW, float PI, String pmid) {
        if (pmid.equals("")) {
            this.sessionFactory.getCurrentSession().createQuery("update com.neuropeptide.entity.NPTab as t set  t.length=" + length + ", t.mw=" + MW + ", t.pi=" + PI + " where t.id=" + id).executeUpdate();
        } else {
            this.sessionFactory.getCurrentSession().createQuery("update com.neuropeptide.entity.NPTab as t set  t.length=" + length + ", t.mw=" + MW + ", t.pi=" + PI + ", t.pmid='" + pmid + "' where t.id=" + id).executeUpdate();
        }

    }

    public void updateLengthById(int id, int length) {
        this.sessionFactory.getCurrentSession().createQuery("update com.neuropeptide.entity.NPTab as t set t.length=" + length + " where t.id=" + id).executeUpdate();
    }

    public void insertRecordToFamilyTab(FamilyTab family) {
        this.sessionFactory.getCurrentSession().save(family);
    }
}
