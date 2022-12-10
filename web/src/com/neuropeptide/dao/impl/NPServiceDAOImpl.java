package com.neuropeptide.dao.impl;

import com.neuropeptide.dao.INPServiceDAO;
import com.neuropeptide.entity.NPTab;
import com.neuropeptide.tools.DataSyncXml;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class NPServiceDAOImpl extends HibernateDaoSupport implements INPServiceDAO {
    public NPServiceDAOImpl() {
    }

    public String getInfo_name(final String name) {
        return (String) this.getHibernateTemplate().execute(new HibernateCallback<String>() {
            public String doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from com.neuropeptide.entity.NPTab as n where n.name = '" + name + "'");
                new ArrayList();
                List list = query.list();
                return (new DataSyncXml()).personListXml(list);
            }
        });
    }

    public String getInfo_seq(String sequence) {
        final String NP_seq = sequence.toUpperCase();
        return (String) this.getHibernateTemplate().execute(new HibernateCallback<String>() {
            public String doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from com.neuropeptide.entity.NPTab as n where n.sequence = '" + NP_seq + "'");
                new ArrayList();
                List list = query.list();
                return (new DataSyncXml()).personListXml(list);
            }
        });
    }

    public String getInfos() {
        return (String) this.getHibernateTemplate().execute(new HibernateCallback<String>() {
            public String doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from com.neuropeptide.entity.NPTab as n");
                new ArrayList();
                List list = query.list();
                return (new DataSyncXml()).personListXml(list);
            }
        });
    }

    public NPTab getInfo_id(final String id) {
        return (NPTab) this.getHibernateTemplate().execute(new HibernateCallback<NPTab>() {
            public NPTab doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from com.neuropeptide.entity.NPTab t where t.id = '" + id + "'");
                NPTab neuropeptide = (NPTab) query.uniqueResult();
                return neuropeptide;
            }
        });
    }

    public NPTab getInfo_num(final String accessNum) {
        return (NPTab) this.getHibernateTemplate().execute(new HibernateCallback<NPTab>() {
            public NPTab doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from com.neuropeptide.entity.NPTab t where t.accessNum = '" + accessNum + "'");
                NPTab neuropeptide = (NPTab) query.uniqueResult();
                return neuropeptide;
            }
        });
    }

    public String getNeuropepName(final String name) {
        return (String) this.getHibernateTemplate().execute(new HibernateCallback<String>() {
            public String doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from com.neuropeptide.entity.NPTab as n where n.name = '" + name + "'");
                new ArrayList();
                List list = query.list();
                JSONArray jsonArray = new JSONArray();

                for (int i = 0; i < list.size(); ++i) {
                    NPTab neuropeptide = (NPTab) list.get(i);
                    jsonArray.add(neuropeptide.getAccessNum());
                }

                return jsonArray.toString();
            }
        });
    }

    public String getNeuropepSeq(String sequence) {
        final String NP_seq = sequence.toUpperCase();
        return (String) this.getHibernateTemplate().execute(new HibernateCallback<String>() {
            public String doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from com.neuropeptide.entity.NPTab as n where n.sequence = '" + NP_seq + "'");
                new ArrayList();
                List list = query.list();
                JSONArray jsonArray = new JSONArray();

                for (int i = 0; i < list.size(); ++i) {
                    NPTab neuropeptide = (NPTab) list.get(i);
                    jsonArray.add(neuropeptide.getAccessNum());
                }

                return jsonArray.toString();
            }
        });
    }
}