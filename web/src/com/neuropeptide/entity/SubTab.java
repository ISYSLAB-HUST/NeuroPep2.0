package com.neuropeptide.entity;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:51
 * @Description:
 */
public class SubTab {
    private int id;
    private String email;
    private String name;
    private String sequence;
    private int length;
    private String organism;
    private String family;
    private String phyla;
    private String tissue_specificity;
    private String uniprotAcc;
    private String description;
    private String activeCode;
    private int isactive;
    private String category;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public SubTab() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSequence() {
        return this.sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence;
    }

    public int getLength() {
        return this.length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public String getOrganism() {
        return this.organism;
    }

    public void setOrganism(String organism) {
        this.organism = organism;
    }

    public String getFamily() {
        return this.family;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String getPhyla() {
        return this.phyla;
    }

    public void setPhyla(String phyla) {
        this.phyla = phyla;
    }

    public String getTissue_specificity() {
        return this.tissue_specificity;
    }

    public void setTissue_specificity(String tissue_specificity) {
        this.tissue_specificity = tissue_specificity;
    }

    public String getUniprotAcc() {
        return this.uniprotAcc;
    }

    public void setUniprotAcc(String uniprotAcc) {
        this.uniprotAcc = uniprotAcc;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getActiveCode() {
        return this.activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }

    public int getIsactive() {
        return this.isactive;
    }

    public void setIsactive(int isactive) {
        this.isactive = isactive;
    }
}
