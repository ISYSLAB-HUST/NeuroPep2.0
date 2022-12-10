package com.neuropeptide.entity;

import javax.persistence.Entity;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:50
 * @Description:
 */
public class FamilyTab {
    private int familyId;
    private String familyName;
    private String familyNameAbbr;

    public FamilyTab() {
    }

    public int getFamilyId() {
        return this.familyId;
    }

    public void setFamilyId(int familyId) {
        this.familyId = familyId;
    }

    public String getFamilyName() {
        return this.familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getFamilyNameAbbr() {
        return this.familyNameAbbr;
    }

    public void setFamilyNameAbbr(String familyNameAbbr) {
        this.familyNameAbbr = familyNameAbbr;
    }
}
