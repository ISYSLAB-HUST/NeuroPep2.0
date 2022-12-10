package com.neuropeptide.service.impl;

import com.neuropeptide.dao.IReceptorDao;
import com.neuropeptide.entity.Receptor;
import com.neuropeptide.service.IReceptorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: engow
 * @Date: 2019/11/11 14:20
 * @Description:
 */
@Service("receptorService")
public class ReceptorServiceImpl implements IReceptorService {
    @Autowired
    private IReceptorDao receptorDao;

    @Transactional
    @Override
    public List<Receptor> listByEntryName(String entryNameList) {
        List<Receptor> receptorList = new ArrayList<>();
        String[] entryNameArr = entryNameList.split("#");
        for (String entryName : entryNameArr) {
            receptorList.addAll(receptorDao.listByEntryName(entryName));
        }
        return receptorList;
    }
}
