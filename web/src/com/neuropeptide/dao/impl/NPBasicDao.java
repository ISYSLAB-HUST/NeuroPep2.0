package com.neuropeptide.dao.impl;

import com.neuropeptide.dao.INPBasicDao;
import com.neuropeptide.entity.NPTab;

import java.util.*;
import java.util.stream.Collectors;

import com.neuropeptide.entity.Receptor;
import com.neuropeptide.entity.ReceptorNew;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("npBasicDao")
public class NPBasicDao implements INPBasicDao {
    @Autowired
    SessionFactory sessionFactory;

    public List<List<String>> getAllSequence() {
        Session session = this.sessionFactory.getCurrentSession();
        String hql = "select new list(sequence, OR_type) from com.neuropeptide.entity.NPTab";
        List<List<String>> sequences = session.createQuery(hql).list();
        return sequences;
    }

    public List<NPTab> getAllInNPTab() {
        return this.sessionFactory.getCurrentSession().createQuery("from com.neuropeptide.entity.NPTab").list();

    }

    public List<String> getAllFamily() {
        return this.sessionFactory.getCurrentSession().createQuery("select DISTINCT(family) from com.neuropeptide.entity.NPTab ORDER BY family ASC").list();
    }

    public List<String> getAllOrganism() {
        return this.sessionFactory.getCurrentSession().createQuery("select DISTINCT(organism) from com.neuropeptide.entity.NPTab ORDER BY organism ASC").list();
    }

    //czq
    @Override
    public List<String> getOrganismByPhyla(String phylaType) {

        return this.sessionFactory.getCurrentSession().createQuery("select DISTINCT(organism) from com.neuropeptide.entity.NPTab where phyla = '" + phylaType + "'" +" ORDER BY organism ASC").list();
    }

    public List<NPTab> getAllNPByFaimly(String family) {
        return this.sessionFactory.getCurrentSession().createQuery("from com.neuropeptide.entity.NPTab where family = '" + family + "'").list();


    }

    public List<NPTab> getAllNPByOrganism(String organism) {
        return this.sessionFactory.getCurrentSession().createQuery("from com.neuropeptide.entity.NPTab where organism = '" + organism + "'"  ).list();
    }

    public List<NPTab> getAllNPByModification(String modification) {
        return this.sessionFactory.getCurrentSession().createQuery("from com.neuropeptide.entity.NPTab  where modification like '%" + modification + "%'").list();
    }

    public List<List<?>> getFamilyAndQuantity() {
        String hql = "select new list(family_short, count(*)) from com.neuropeptide.entity.NPTab GROUP BY(family_short) ORDER BY col_1_0_ DESC";
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery(hql);
        List<List<?>> result = query.list();
        return result;
    }

    public List<List<?>> getOrganismAndQuantity() {
        String hql = "select new list(organism, count(*)) from com.neuropeptide.entity.NPTab GROUP BY(organism) ORDER BY col_1_0_ DESC";
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery(hql);
        List<List<?>> result = query.list();
        return result;
    }

    public long getNumsOfPeptides() {
        String hql = "select count(*) from com.neuropeptide.entity.NPTab";
        return (Long) this.sessionFactory.getCurrentSession().createQuery(hql).list().get(0);
    }

    public List<Object[]> getLengthAndORType() {
        Session session = this.sessionFactory.getCurrentSession();
        String hql = "select sequence,p.length from NPTab p";
        List<Object[]> sequences = session.createQuery(hql).list();
        return sequences;
    }

    public Map<String, List<List<Object>>> getOrganismAndORType() {
        Session session = this.sessionFactory.getCurrentSession();
        String hql1 = "select new list(organism,count(*)) from com.neuropeptide.entity.NPTab WHERE OR_type = 'invertebrate 'GROUP BY(organism) ORDER BY col_1_0_ DESC";
        String hql2 = "select new list(organism,count(*)) from com.neuropeptide.entity.NPTab WHERE OR_type = 'Vertebrate'GROUP BY(organism) ORDER BY col_1_0_ DESC";
        Query query1 = session.createQuery(hql1);
        query1.setFirstResult(0);
        query1.setMaxResults(10);
        Query query2 = session.createQuery(hql2);
        query2.setFirstResult(0);
        query2.setMaxResults(10);
        List<List<Object>> organism1 = query1.list();
        List<List<Object>> organism2 = query2.list();
        Map<String, List<List<Object>>> result = new HashMap();
        result.put("invertebrate", organism1);
        result.put("vertebrate", organism2);
        return result;
    }



    public List<List<?>> getPhylaAndQuantity() {
        Session session = this.sessionFactory.getCurrentSession();
        String hql = "SELECT new list((case when phyla='' then 'NA' else phyla end) as phyla, COUNT(*) as count) from com.neuropeptide.entity.NPTab GROUP BY(phyla) ORDER BY col_1_0_ DESC";
        List<List<?>> sequences = session.createQuery(hql).list();
        return sequences;
    }

    public List<String> getAllUniqueSequence() {
        Session session = this.sessionFactory.getCurrentSession();
        String hql = "select sequence from com.neuropeptide.entity.NPTab";
        List<String> sequences = session.createQuery(hql).list();
        return sequences;
    }

    public List<List<?>> getSourceAndQuantity() {
        Session session = this.sessionFactory.getCurrentSession();
        String hql = "SELECT new list(source, COUNT(*) as count) from com.neuropeptide.entity.NPTab GROUP BY(source) ORDER BY col_1_0_ DESC";
        List<List<?>> result = session.createQuery(hql).list();
        return result;
    }


   //add receptor's method which gets all family
    public List<String> getAllRecFamily() {
        return this.sessionFactory.getCurrentSession().createQuery("select DISTINCT(family) from com.neuropeptide.entity.ReceptorNew ORDER BY family ASC").list();
    }

    //add receptor's method which gets all organism
    public List<String> getAllRecOrganism() {
        return this.sessionFactory.getCurrentSession().createQuery("select DISTINCT(organism) from com.neuropeptide.entity.ReceptorNew ORDER BY organism ASC").list();
    }

    //add method which gets Receptor by family
    public List<ReceptorNew> getAllRecByFaimly(String family) {
        return this.sessionFactory.getCurrentSession().createQuery("from com.neuropeptide.entity.ReceptorNew where family = '" + family + "'").list();
    }

    //add method which gets Receptor by organism
    public List<ReceptorNew> getAllRecyOrganism(String organism) {
        return this.sessionFactory.getCurrentSession().createQuery("from com.neuropeptide.entity.ReceptorNew where organism = '" + organism + "'").list();
    }

    //add method which gets Receptor by modification
    public List<ReceptorNew> getAllRecByModification(String modification) {
        return this.sessionFactory.getCurrentSession().createQuery("from com.neuropeptide.entity.ReceptorNew where modification like '" + modification + "'").list();
    }

    //add
    public List<String> getAllPhyla() {
        return this.sessionFactory.getCurrentSession().createQuery("select DISTINCT (phyla) from com.neuropeptide.entity.NPTab ORDER BY phyla ASC ").list();
    }

    //add
    public List<String> getAllOrganismByPhyla(String phyla) {
        return this.sessionFactory.getCurrentSession().
                createQuery("select DISTINCT(organism) from com.neuropeptide.entity.NPTab where phyla = '" + phyla +"'order by organism ASC ").list();
    }


    public List<String> getAllRecPhyla() {
        return this.sessionFactory.getCurrentSession().createQuery("select DISTINCT (phyla) from com.neuropeptide.entity.ReceptorNew ORDER BY phyla ASC ").list();
    }


    public List<String> getAllOrganismRecByPhyla(String phyla) {
        return this.sessionFactory.getCurrentSession().
                createQuery("select DISTINCT(organism) from com.neuropeptide.entity.ReceptorNew where phyla = '" + phyla +"'order by organism ASC ").list();
    }


}

