package com.neuropeptide.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:08
 * @Description:
 */
public class IStatisticsDao {
    @Autowired
    private SessionFactory sessionFactory;

    public IStatisticsDao() {
    }

    protected Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }
}
