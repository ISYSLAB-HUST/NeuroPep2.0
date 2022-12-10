package com.neuropeptide.dao;

import com.neuropeptide.entity.NPTab;

import java.util.List;

import net.sf.json.JSONArray;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:31
 * @Description:
 */
public interface INPSearchDAO {
    List search(String var1);

    NPTab searchByAccNum(String var1);

    JSONArray searchLenDistr();

    JSONArray searchFamiDistr();

    JSONArray searchOrgaDistr();

    JSONArray searchSourDistr();
}
