package com.neuropeptide.dao;

import com.neuropeptide.entity.FamilyTab;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:30
 * @Description:
 */
public interface INPGenerateDao {
    void updateAllFieldById(int var1, int var2, float var3, float var4, String var5);

    void updateLengthById(int var1, int var2);

    void insertRecordToFamilyTab(FamilyTab var1);
}
