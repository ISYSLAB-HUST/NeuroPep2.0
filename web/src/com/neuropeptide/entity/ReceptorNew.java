package com.neuropeptide.entity;

import java.util.List;
import java.util.Map;

/**
 * @author Wclouds
 * @since 2021/7/26
 */
public class ReceptorNew {
    //共24个实名域
    private int id;   //ID
    private String accessNum; //NPRID
    private String name; //Name
    private String sequence; //Sequence
    private String family; //family
    private String organism; //Organism
    private Integer Taxa_ID; //TAXA_ID
    private String UnitProt_ID; //UnitProt_ID
    private String OR_type; //OR_type
    private String goinfo; //Go
    private String pdb; //PDB_id
    private String modification; //Modification
    private String TissueSpecifity; //TISSUE_SPECIFITY TissueSpecifity
    private String function; //Function
    private int length; //len
    private String stringId; //STRING_id
    private String reactome; //Reactome
    private String guidetop; //GuidetoP
    private String entry;

    public String getEntry() {
        return entry;
    }

    public void setEntry(String entry) {
        this.entry = entry;
    }

    public String getReactome() {
        return reactome;
    }

    public void setReactome(String reactome) {
        this.reactome = reactome;
    }

    public String getGuidetop() {
        return guidetop;
    }

    public void setGuidetop(String guidetop) {
        this.guidetop = guidetop;
    }

    private String phyla; //Phyla
    private String pubmedId; //Pubmed_id
    private String lineage; //Lineage

    //受体对应神经肽的集合
    private String neuropeptide; //np_ids
    private String npr_infos; //npr_infos
    private int np_num; //np_num

    private List<Map<String, Object>> nodes;
    private List<Map<String, Object>> lines;
    private String nodesStr;
    private String linesStr;

    private String drugbank;
    private String chEMBL;
    private String drugCentral;
    private String complexPdb;

    private String np_ids;;
    private String predictASA;
    private String realASA;

    private String gene;

    public String getGene() {
        return gene;
    }

    public void setGene(String gene) {
        this.gene = gene;
    }

    public String getPredictASA() {
        return predictASA;
    }

    public void setPredictASA(String predictASA) {
        this.predictASA = predictASA;
    }

    public String getRealASA() {
        return realASA;
    }

    public void setRealASA(String realASA) {
        this.realASA = realASA;
    }

    public String getNp_ids() {
        return np_ids;
    }

    public void setNp_ids(String np_ids) {
        this.np_ids = np_ids;
    }

    public String getDrugbank() {
        return drugbank;
    }

    public void setDrugbank(String drugbank) {
        this.drugbank = drugbank;
    }

    public String getChEMBL() {
        return chEMBL;
    }

    public void setChEMBL(String chEMBL) {
        this.chEMBL = chEMBL;
    }

    public String getDrugCentral() {
        return drugCentral;
    }

    public void setDrugCentral(String drugCentral) {
        this.drugCentral = drugCentral;
    }

    public String getComplexPdb() {
        return complexPdb;
    }

    public void setComplexPdb(String complexPdb) {
        this.complexPdb = complexPdb;
    }

    private String neuroListStr;
    private List<NPTab> neuroList;

    public List<Map<String, Object>> getNodes() {
        return nodes;
    }

    public void setNodes(List<Map<String, Object>> nodes) {
        this.nodes = nodes;
    }

    public List<Map<String, Object>> getLines() {
        return lines;
    }

    public void setLines(List<Map<String, Object>> lines) {
        this.lines = lines;
    }

    public String getNodesStr() {
        return nodesStr;
    }

    public void setNodesStr(String nodesStr) {
        this.nodesStr = nodesStr;
    }

    public String getLinesStr() {
        return linesStr;
    }

    public void setLinesStr(String linesStr) {
        this.linesStr = linesStr;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }





    public String getNpr_infos() {
        return npr_infos;
    }

    public void setNpr_infos(String npr_infos) {
        this.npr_infos = npr_infos;
    }

    public int getNp_num() {
        return np_num;
    }

    public void setNp_num(int np_num) {
        this.np_num = np_num;
    }



    public String getNeuropeptide() {
        return neuropeptide;
    }

    public void setNeuropeptide(String neuropeptide) {
        this.neuropeptide = neuropeptide;
    }





    public ReceptorNew() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccessNum() {
        return accessNum;
    }

    public void setAccessNum(String accessNum) {
        this.accessNum = accessNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSequence() {
        return sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence;
    }

    public String getFamily() {
        return family;
    }

    public void setFamily(String family) {
        this.family = family;
    }


    public String getOrganism() {
        return organism;
    }

    public void setOrganism(String organism) {
        this.organism = organism;
    }

    public Integer getTaxa_ID() {
        return Taxa_ID;
    }

    public void setTaxa_ID(Integer taxa_ID) {
        Taxa_ID = taxa_ID;
    }

    public String getUnitProt_ID() {
        return UnitProt_ID;
    }

    public void setUnitProt_ID(String unitProt_ID) {
        UnitProt_ID = unitProt_ID;
    }

    public String getOR_type() {
        return OR_type;
    }

    public void setOR_type(String OR_type) {
        this.OR_type = OR_type;
    }

    public String getGoinfo() {
        return goinfo;
    }

    public void setGoinfo(String goinfo) {
        this.goinfo = goinfo;
    }

    public String getPdb() {
        return pdb;
    }

    public void setPdb(String pdb) {
        this.pdb = pdb;
    }

    public String getModification() {
        return modification;
    }

    public void setModification(String modification) {
        this.modification = modification;
    }

    public String getTissueSpecifity() {
        return TissueSpecifity;
    }

    public void setTissueSpecifity(String tissueSpecifity) {
        TissueSpecifity = tissueSpecifity;
    }

    public String getPhyla() {
        return phyla;
    }

    public void setPhyla(String phyla) {
        this.phyla = phyla;
    }

    public String getPubmedId() {
        return pubmedId;
    }

    public void setPubmedId(String pubmedId) {
        this.pubmedId = pubmedId;
    }

    public String getLineage() {
        return lineage;
    }

    public void setLineage(String lineage) {
        this.lineage = lineage;
    }

    public String getNeuroListStr() {
        return neuroListStr;
    }

    public void setNeuroListStr(String neuroListStr) {
        this.neuroListStr = neuroListStr;
    }

    public List<NPTab> getNeuroList() {
        return neuroList;
    }

    public void setNeuroList(List<NPTab> neuroList) {
        this.neuroList = neuroList;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getStringId() {
        return stringId;
    }

    public void setStringId(String stringId) {
        this.stringId = stringId;
    }
}