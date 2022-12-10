package com.neuropeptide.service;

import com.neuropeptide.entity.Receptor;

import java.util.List;

/**
 * @Auther: engow
 * @Date: 2019/11/11 14:20
 * @Description:
 */
public interface IReceptorService {
    List<Receptor> listByEntryName(String entryName);
}
