package com.neuropeptide.dao;

import com.neuropeptide.entity.Receptor;

import java.util.List;

/**
 * @Auther: engow
 * @Date: 2019/11/11 14:13
 * @Description:
 */
public interface IReceptorDao {
    List<Receptor> listByEntryName(String entryName);
}
