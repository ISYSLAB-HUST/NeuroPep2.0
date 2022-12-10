package com.neuropeptide.dao.impl;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import com.neuropeptide.dao.IDeleteDAO;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:27
 * @Description:
 */
@Repository("IDeleteDAO")
public class DeleteDAOImpl extends HibernateDaoSupport implements IDeleteDAO {
    public DeleteDAOImpl() {
    }

    @Override
    public void delete(final String hql) {
        this.getHibernateTemplate().execute(new HibernateCallback<Object>() {
            public Object doInHibernate(Session session) throws SQLException, HibernateException {
                Query query = session.createQuery(hql);
                query.executeUpdate();
                return null;
            }
        });
    }
}
