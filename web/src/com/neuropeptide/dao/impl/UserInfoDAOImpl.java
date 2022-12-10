package com.neuropeptide.dao.impl;

import com.neuropeptide.dao.IUserInfoDAO;
import com.neuropeptide.entity.UserInfo;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class UserInfoDAOImpl extends HibernateDaoSupport implements IUserInfoDAO {
    public UserInfoDAOImpl() {
    }

    public UserInfo findByLoginName(final String username) {
        return (UserInfo) this.getHibernateTemplate().execute(new HibernateCallback<UserInfo>() {
            public UserInfo doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("FROM UserInfo c where c.username=?");
                query.setParameter(0, username);
                UserInfo s = (UserInfo) query.uniqueResult();
                return s;
            }
        });
    }
}
