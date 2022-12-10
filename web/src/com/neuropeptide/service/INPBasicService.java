package com.neuropeptide.service;

import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.Receptor;
import com.neuropeptide.entity.ReceptorNew;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface INPBasicService {
    List<String> getAllFamily();

    List<String> getAllOrganism();


    List<String> getOrganismByPhyla(String phylaType);


    List<NPTab> getAllNPByFaimly(String var1);


    List<NPTab> getAllNPByOrganism(String var1);

    List<NPTab> getAllNPByModification(String var1);

    @Transactional
    List<Receptor> getAllReceptors(String receptors);

    //add receptor's method
    List<String> getAllRecFamily();
    List<String> getAllRecOrganism();


    //add method which gets Receptor by family ... organism...modification
    List<ReceptorNew> getAllRecByFaimly(String var1);
    List<ReceptorNew> getAllRecyOrganism(String var1);
    List<ReceptorNew> getAllRecByModification(String var1);

    //add
    //增加对获取所有门类的业务定义接口
    List<String> getAllPhyla();

    //增加通过phyla获取organism
    //该方法需要增加事务管理
    //新版本的hibernate要求开发者必须配置事务管理，因为session的创建和销毁都是被事务管理的
    List<String> getAllOrganismByPhyla(String phyla);


    //receptor增加定义获取所有门phyla的接口 获取全部一级分类：门
    List<String> getAllRecPhyla();
    List<String> getAllOrganismRecByPhyla(String phyla);


}
