package com.neuropeptide.service;

import com.neuropeptide.entity.UserInfo;

public interface IUserInfoService {
    String verifyPassword(String var1, String var2);

    UserInfo findByLoginName(String var1);
}
