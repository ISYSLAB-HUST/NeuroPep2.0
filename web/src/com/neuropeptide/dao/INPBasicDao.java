package com.neuropeptide.dao;

import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.ReceptorNew;

import java.util.List;
import java.util.Map;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:29
 * @Description:
 */
public interface INPBasicDao {
    List<NPTab> getAllInNPTab();

    List<List<String>> getAllSequence();

    List<String> getAllUniqueSequence();

    List<String> getAllFamily();

    List<String> getAllOrganism();

    List<String> getOrganismByPhyla(String phylaType);

    List<NPTab> getAllNPByFaimly(String var1);

    List<NPTab> getAllNPByOrganism(String var1);

    List<NPTab> getAllNPByModification(String var1);

    List<List<?>> getFamilyAndQuantity();

    List<List<?>> getOrganismAndQuantity();

    List<List<?>> getPhylaAndQuantity();

    List<List<?>> getSourceAndQuantity();

    long getNumsOfPeptides();

    List<Object[]> getLengthAndORType();

    Map<String, List<List<Object>>> getOrganismAndORType();

    //add method which get all receptor's family ...organism...
    List<String> getAllRecFamily();
    List<String> getAllRecOrganism();

    //add method which gets Receptor by family ... organism...modification
    List<ReceptorNew> getAllRecByFaimly(String var1);
    List<ReceptorNew> getAllRecyOrganism(String var1);
    List<ReceptorNew> getAllRecByModification(String var1);


    //neuro增加定义获取所有门phyla的接口 获取全部一级分类：门
    List<String> getAllPhyla();
    List<String> getAllOrganismByPhyla(String phyla);

    //receptor增加定义获取所有门phyla的接口 获取全部一级分类：门
    List<String> getAllRecPhyla();
    List<String> getAllOrganismRecByPhyla(String phyla);
}
