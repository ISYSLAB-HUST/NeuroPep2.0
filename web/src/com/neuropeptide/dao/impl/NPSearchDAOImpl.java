package com.neuropeptide.dao.impl;

import com.neuropeptide.dao.INPSearchDAO;
import com.neuropeptide.entity.NPTab;

import java.sql.SQLException;
import java.util.List;

import net.sf.json.JSONArray;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


public class NPSearchDAOImpl extends HibernateDaoSupport implements INPSearchDAO {
    public NPSearchDAOImpl() {
    }

    public List search(final String hql) {
        return this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session s) throws HibernateException, SQLException {
                Query query = s.createQuery(hql);
                List list = query.list();
                return list;
            }
        });
    }

    public NPTab searchByAccNum(final String accessionNum) {
        return (NPTab) this.getHibernateTemplate().execute(new HibernateCallback<NPTab>() {
            public NPTab doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from com.neuropeptide.entity.NPTab t where t.accessNum = '" + accessionNum + "'");
                NPTab neuropeptide = (NPTab) query.uniqueResult();
                return neuropeptide;
            }
        });
    }

    public JSONArray searchLenDistr() {
        return (JSONArray) this.getHibernateTemplate().execute(new HibernateCallback<JSONArray>() {
            public JSONArray doInHibernate(Session session) throws HibernateException, SQLException {
                int max = (Integer) session.createQuery("select max(m.length) from com.neuropeptide.entity.NPTab m").uniqueResult();
                JSONArray jsonArray = new JSONArray();
                String hqlLen = "select count(*) from com.neuropeptide.entity.NPTab as l where l.length = ?";

                for (int i = 1; i <= max; ++i) {
                    int count = ((Long) session.createQuery(hqlLen).setParameter(0, i).uniqueResult()).intValue();
                    jsonArray.add(count);
                }

                return jsonArray;
            }
        });
    }

    public JSONArray searchFamiDistr() {
        return (JSONArray) this.getHibernateTemplate().execute(new HibernateCallback<JSONArray>() {
            public JSONArray doInHibernate(Session session) throws HibernateException, SQLException {
                List distFamily = session.createQuery("select distinct family from com.neuropeptide.entity.NPTab").list();
                int len = distFamily.size();
                int[] famiArray = new int[len];
                String hqlFami = "select count(*) from com.neuropeptide.entity.NPTab as f where f.family = ?";
                int countAll = 0;

                int temp;
                for (int ix = 0; ix < len; ++ix) {
                    temp = ((Long) session.createQuery(hqlFami).setParameter(0, distFamily.get(ix)).uniqueResult()).intValue();
                    famiArray[ix] = temp;
                    countAll += temp;
                }

                int[] famiArrayTemp = new int[len];

                for (temp = 0; temp < len; ++temp) {
                    famiArrayTemp[temp] = famiArray[temp];
                }

                int jx;
                for (int ixx = 0; ixx < 20; ++ixx) {
                    for (jx = ixx + 1; jx < len; ++jx) {
                        if (famiArrayTemp[ixx] < famiArrayTemp[jx]) {
                            temp = famiArrayTemp[jx];
                            famiArrayTemp[jx] = famiArrayTemp[ixx];
                            famiArrayTemp[ixx] = temp;
                        }
                    }
                }

                JSONArray jsonArray = new JSONArray();
                jx = 0;

                for (int i = 0; i < 10; ++i) {
                    JSONArray jsonArrayTemp = new JSONArray();

                    for (int j = 0; j < len; ++j) {
                        if (famiArray[j] == famiArrayTemp[i]) {
                            jsonArrayTemp.add(distFamily.get(j));
                            jsonArrayTemp.add(famiArrayTemp[i]);
                            jx += famiArrayTemp[i];
                        }
                    }

                    jsonArray.add(jsonArrayTemp);
                }

                JSONArray jsonArrayOthers = new JSONArray();
                jsonArrayOthers.add("others");
                jsonArrayOthers.add(countAll - jx);
                jsonArray.add(jsonArrayOthers);
                System.out.println(jsonArray.toString());
                return jsonArray;
            }
        });
    }

    public JSONArray searchOrgaDistr() {
        return (JSONArray) this.getHibernateTemplate().execute(new HibernateCallback<JSONArray>() {
            public JSONArray doInHibernate(Session session) throws HibernateException, SQLException {
                List distOrganism = session.createQuery("select distinct organism from com.neuropeptide.entity.NPTab").list();
                int len = distOrganism.size();
                int[] orgaArray = new int[len];
                String hqlOrga = "select count(*) from com.neuropeptide.entity.NPTab as f where f.organism = ?";
                int countAll = 0;

                int temp;
                for (int ix = 0; ix < len; ++ix) {
                    temp = ((Long) session.createQuery(hqlOrga).setParameter(0, distOrganism.get(ix)).uniqueResult()).intValue();
                    orgaArray[ix] = temp;
                    countAll += temp;
                }

                int[] orgaArrayTemp = new int[len];

                for (temp = 0; temp < len; ++temp) {
                    orgaArrayTemp[temp] = orgaArray[temp];
                }

                int jx;
                for (int ixx = 0; ixx < 20; ++ixx) {
                    for (jx = ixx + 1; jx < len; ++jx) {
                        if (orgaArrayTemp[ixx] < orgaArrayTemp[jx]) {
                            temp = orgaArrayTemp[jx];
                            orgaArrayTemp[jx] = orgaArrayTemp[ixx];
                            orgaArrayTemp[ixx] = temp;
                        }
                    }
                }

                JSONArray jsonArray = new JSONArray();
                jx = 0;

                for (int i = 0; i < 20; ++i) {
                    JSONArray jsonArrayTemp = new JSONArray();

                    for (int j = 0; j < len; ++j) {
                        if (orgaArray[j] == orgaArrayTemp[i]) {
                            jsonArrayTemp.add(distOrganism.get(j));
                            jsonArrayTemp.add(orgaArrayTemp[i]);
                            jx += orgaArrayTemp[i];
                        }
                    }

                    jsonArray.add(jsonArrayTemp);
                }

                JSONArray jsonArrayOthers = new JSONArray();
                jsonArrayOthers.add("others");
                jsonArrayOthers.add(countAll - jx);
                jsonArray.add(jsonArrayOthers);
                System.out.println(jsonArray.toString());
                return jsonArray;
            }
        });
    }

    public JSONArray searchSourDistr() {
        return (JSONArray) this.getHibernateTemplate().execute(new HibernateCallback<JSONArray>() {
            public JSONArray doInHibernate(Session session) throws HibernateException, SQLException {
                List distSource = session.createQuery("select distinct source from com.neuropeptide.entity.NPTab").list();
                int len = distSource.size();
                int[] sourArray = new int[len];
                String hqlSour = "select count(*) from com.neuropeptide.entity.NPTab as f where f.source = ?";

                int ix;
                for (int i = 0; i < len; ++i) {
                    ix = ((Long) session.createQuery(hqlSour).setParameter(0, distSource.get(i)).uniqueResult()).intValue();
                    sourArray[i] = ix;
                }

                JSONArray jsonArray = new JSONArray();

                for (ix = 0; ix < len; ++ix) {
                    JSONArray jsonArrayTemp = new JSONArray();
                    jsonArrayTemp.add(distSource.get(ix));
                    jsonArrayTemp.add(sourArray[ix]);
                    jsonArray.add(jsonArrayTemp);
                }

                System.out.println(jsonArray.toString());
                return jsonArray;
            }
        });
    }
}