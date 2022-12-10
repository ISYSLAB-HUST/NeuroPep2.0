package com.neuropeptide.entity;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:51
 * @Description:
 */
public class UserInfo {
    private int id;
    private String username;
    private String password;
    private String update_time;

    public UserInfo() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUpdate_time() {
        return this.update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }
}
