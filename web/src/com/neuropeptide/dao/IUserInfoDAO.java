package com.neuropeptide.dao;

import com.neuropeptide.entity.UserInfo;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:34
 * @Description:
 */
public interface IUserInfoDAO {
    UserInfo findByLoginName(String var1);
}
