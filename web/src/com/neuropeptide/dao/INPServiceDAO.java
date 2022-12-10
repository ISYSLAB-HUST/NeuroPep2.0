package com.neuropeptide.dao;

import com.neuropeptide.entity.NPTab;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:32
 * @Description:
 */
public interface INPServiceDAO {
    String getInfos();

    NPTab getInfo_id(String var1);

    NPTab getInfo_num(String var1);

    String getInfo_name(String var1);

    String getInfo_seq(String var1);

    String getNeuropepName(String var1);

    String getNeuropepSeq(String var1);
}
