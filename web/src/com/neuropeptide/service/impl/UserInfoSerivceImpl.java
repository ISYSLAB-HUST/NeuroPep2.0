package com.neuropeptide.service.impl;

import com.neuropeptide.dao.IUserInfoDAO;
import com.neuropeptide.entity.UserInfo;
import com.neuropeptide.service.IUserInfoService;

public class UserInfoSerivceImpl implements IUserInfoService {
    private IUserInfoDAO userInfoDAO;

    public UserInfoSerivceImpl() {
    }

    public IUserInfoDAO getUserInfoDAO() {
        return this.userInfoDAO;
    }

    public void setUserInfoDAO(IUserInfoDAO userInfoDAO) {
        this.userInfoDAO = userInfoDAO;
    }

    public String verifyPassword(String username, String password) {
        UserInfo user = this.userInfoDAO.findByLoginName(username);
        if (user == null) {
            return "10001";
        } else if (password == null) {
            return "10002";
        } else {
            return password.equals(user.getPassword()) ? "00000" : "10003";
        }
    }

    public UserInfo findByLoginName(String username) {
        return this.userInfoDAO.findByLoginName(username);
    }
}
