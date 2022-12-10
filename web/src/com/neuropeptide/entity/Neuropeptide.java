package com.neuropeptide.entity;

import java.io.Serializable;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:50
 * @Description:
 */
public class Neuropeptide implements Serializable {
    private static final long serialVersionUID = -6020662935298101454L;
    private Integer id;
    private String accessId;
    private String sequence;
    private String name;
    private String species;
    private String uniprotId;

    public Neuropeptide() {
    }

    public Neuropeptide(String accessId, String sequence, String name, String species, String uniprotId) {
        this.accessId = accessId;
        this.sequence = sequence;
        this.name = name;
        this.species = species;
        this.uniprotId = uniprotId;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccessId() {
        return this.accessId;
    }

    public void setAccessId(String accessId) {
        this.accessId = accessId;
    }

    public String getSequence() {
        return this.sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecies() {
        return this.species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getUniprotId() {
        return this.uniprotId;
    }

    public void setUniprotId(String uniprotId) {
        this.uniprotId = uniprotId;
    }
}
