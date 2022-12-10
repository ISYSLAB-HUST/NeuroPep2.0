package com.neuropeptide.service;

import com.neuropeptide.entity.NPTab;

import java.util.List;

import com.neuropeptide.entity.Receptor;
import net.sf.json.JSONArray;
import org.springframework.transaction.annotation.Transactional;

public interface INPSearchService {
    List search(String var1);

    NPTab searchByAccNum(String var1);

    JSONArray searchLenDistr();

    JSONArray searchFamiDistr();

    JSONArray searchOrgaDistr();

    JSONArray searchSourDistr();
}
