package com.neuropeptide.dao.impl;

import com.neuropeptide.dao.IReceptorDao;
import com.neuropeptide.entity.Receptor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Auther: engow
 * @Date: 2019/11/11 14:13
 * @Description:
 */
@Repository("receptorDao")
public class ReceptorDaoImpl implements IReceptorDao {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<Receptor> listByEntryName(String entryName) {
        Session session = this.sessionFactory.getCurrentSession();
        String hql = "from com.neuropeptide.entity.Receptor where entryName='" + entryName + "'";
        List<Receptor> receptorList = session.createQuery(hql).list();
        return receptorList;
    }
}
