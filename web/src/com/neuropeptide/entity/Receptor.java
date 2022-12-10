package com.neuropeptide.entity;

public class Receptor {
    private int id;
    private String entryName;
    private String proteinName;
    private String geneName;
    private String organism;
    private int length;
    private String function;
    private String proteinFamily;
    private String taxonomicLinege;
    private String pubMedId;
    private String geneOnthologyIds;
    private String tissueSpecificity;
    private String sequence;

    public String getEntryName() {
        return entryName;
    }

    public void setEntryName(String entryName) {
        this.entryName = entryName;
    }

    public String getProteinName() {
        return proteinName;
    }

    public void setProteinName(String proteinName) {
        this.proteinName = proteinName;
    }

    public String getGeneName() {
        return geneName;
    }

    public void setGeneName(String geneName) {
        this.geneName = geneName;
    }

    public String getOrganism() {
        return organism;
    }

    public void setOrganism(String organism) {
        this.organism = organism;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getProteinFamily() {
        return proteinFamily;
    }

    public void setProteinFamily(String proteinFamily) {
        this.proteinFamily = proteinFamily;
    }

    public String getTaxonomicLinege() {
        return taxonomicLinege;
    }

    public void setTaxonomicLinege(String taxonomicLinege) {
        this.taxonomicLinege = taxonomicLinege;
    }

    public String getPubMedId() {
        return pubMedId;
    }

    public void setPubMedId(String pubMedId) {
        this.pubMedId = pubMedId;
    }

    public String getGeneOnthologyIds() {
        return geneOnthologyIds;
    }

    public void setGeneOnthologyIds(String geneOnthologyIds) {
        this.geneOnthologyIds = geneOnthologyIds;
    }

    public String getTissueSpecificity() {
        return tissueSpecificity;
    }

    public void setTissueSpecificity(String tissueSpecificity) {
        this.tissueSpecificity = tissueSpecificity;
    }

    public String getSequence() {
        return sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }
}
