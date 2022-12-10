package com.neuropeptide.dao;

import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.SubTab;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:32
 * @Description:
 */
public interface ISaveDAO {
    void saveSubmission(SubTab var1);

    void saveApproval(NPTab var1);
}
