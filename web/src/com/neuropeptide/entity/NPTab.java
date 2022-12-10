package com.neuropeptide.entity;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;
import java.util.Map;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:50
 * @Description:
 */
@XmlRootElement(name = "Neuropeptide")
@XmlAccessorType(XmlAccessType.FIELD)
public class NPTab {

    private int id;
    private String accessNum;
    private String name;
    private String sequence;
    //mod 2021.09.12
    //private int length;
    private Integer length;
    private String family;
    private String organism;
    private String orginal_form;
    private String source;
    private String pdb;
    private String modification;
    private float mw;
    private float pi;
    private String family_short;
    //private Integer Taxa_ID;
    private String Taxa_ID;
    private String UnitProt_ID;
    private String OR_type;
    private String goinfo;
    private String gene_Family;
    private String pmid;
    private String phyla;
    private String Peptide_REF;
    private String TISSUE_SPECIFITY;

    private String pubmedId;
    private String receptor;
    private Integer taxaId;
    private String lineage;
    private String function;
    private String tissueSpecifity;
    private String stringId;

    private String drugBank;
    private String chEMBL;
    private String drugCentral;
    private String complexPdb;
    private String phyProperties;
    private String hydropathy;
    private String predictASA;
    private String realASA;
    private String realASAPos;



    private String modification_change;

    public String getModification_change() {
        return modification_change;
    }

    public void setModification_change(String modification_change) {
        this.modification_change = modification_change;
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

    public String getRealASAPos() {
        return realASAPos;
    }

    public void setRealASAPos(String realASAPos) {
        this.realASAPos = realASAPos;
    }

    public String getPhyProperties() {
        return phyProperties;
    }

    public void setPhyProperties(String phyProperties) {
        this.phyProperties = phyProperties;
    }

    public String getHydropathy() {
        return hydropathy;
    }

    public void setHydropathy(String hydropathy) {
        this.hydropathy = hydropathy;
    }

    public void setTaxaId(Integer taxaId) {
        this.taxaId = taxaId;
    }

    public String getDrugBank() {
        return drugBank;
    }

    public void setDrugBank(String drugBank) {
        this.drugBank = drugBank;
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

    private List<Map<String, Object>> nodes;

    private List<Map<String, Object>> lines;

    private String nodesStr;
    private String linesStr;

    private List<Receptor> receptorList;
    private String receptorListStr;
    private String receptorIds;

    private String gene;

    public String getGene() {
        return gene;
    }

    public void setGene(String gene) {
        this.gene = gene;
    }

    public String getReceptorIds() {
        return receptorIds;
    }

    public void setReceptorIds(String receptorIds) {
        this.receptorIds = receptorIds;
    }
//增加字段 接受ids
//    public List<String>  receptorIds;

//    public List getReceptorIds() {
//        return receptorIds;
//    }
//
//    public void setReceptorIds(List receptorIds) {
//        this.receptorIds = receptorIds;
//    }

    public NPTab() {
    }

    public String getPmid() {
        return this.pmid;
    }

    public void setPmid(String pmid) {
        this.pmid = pmid;
    }

    public String getGene_Family() {
        return this.gene_Family;
    }

    public void setGene_Family(String gene_Family) {
        this.gene_Family = gene_Family;
    }

    public String getPeptide_REF() {
        return this.Peptide_REF;
    }

    public void setPeptide_REF(String peptide_REF) {
        this.Peptide_REF = peptide_REF;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccessNum() {
        return this.accessNum;
    }

    public void setAccessNum(String accessNum) {
        this.accessNum = accessNum;
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

    /*public int getLength() {
        return this.length;
    }

    public void setLength(int length) {
        this.length = length;
    }*/

    //mod
    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public String getFamily() {
        return this.family;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String getOrganism() {
        return this.organism;
    }

    public void setOrganism(String organism) {
        this.organism = organism;
    }

    public String getOrginal_form() {
        return this.orginal_form;
    }

    public void setOrginal_form(String orginal_form) {
        this.orginal_form = orginal_form;
    }

    public String getSource() {
        return this.source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getPdb() {
        return this.pdb;
    }

    public void setPdb(String pdb) {
        this.pdb = pdb;
    }

    public String getModification() {
        return this.modification;
    }

    public void setModification(String modification) {
        this.modification = modification;
    }

    public float getMw() {
        return this.mw;
    }

    public void setMw(float mw) {
        this.mw = mw;
    }

    public float getPi() {
        return this.pi;
    }

    public void setPi(float pi) {
        this.pi = pi;
    }

    /*public Integer getTaxa_ID() {
        return this.Taxa_ID;
    }

    public void setTaxa_ID(Integer taxa_ID) {
        this.Taxa_ID = taxa_ID;
    }*/

    public String getTaxa_ID() {
        return Taxa_ID;
    }

    public void setTaxa_ID(String taxa_ID) {
        Taxa_ID = taxa_ID;
    }

    public String getUnitProt_ID() {
        return this.UnitProt_ID;
    }

    public void setUnitProt_ID(String unitProt_ID) {
        this.UnitProt_ID = unitProt_ID;
    }

    public String getFamily_short() {
        return this.family_short;
    }

    public void setFamily_short(String family_short) {
        this.family_short = family_short;
    }

    public String getOR_type() {
        return this.OR_type;
    }

    public void setOR_type(String oR_type) {
        this.OR_type = oR_type;
    }

    public String getGoinfo() {
        return this.goinfo;
    }

    public void setGoinfo(String goinfo) {
        this.goinfo = goinfo;
    }

    public String getTISSUE_SPECIFITY() {
        return this.TISSUE_SPECIFITY;
    }

    public void setTISSUE_SPECIFITY(String tISSUE_SPECIFITY) {
        this.TISSUE_SPECIFITY = tISSUE_SPECIFITY;
    }

    public String getPhyla() {
        return this.phyla;
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

    public String getReceptor() {
        return receptor;
    }

    public void setReceptor(String receptor) {
        this.receptor = receptor;
    }

    public Integer getTaxaId() {
        return taxaId;
    }

    public void setTaxaId(String taxaId) {
        this.taxaId = Integer.valueOf(taxaId).intValue();
    }

    public String getLineage() {
        return lineage;
    }

    public void setLineage(String lineage) {
        this.lineage = lineage;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getTissueSpecifity() {
        return tissueSpecifity;
    }

    public void setTissueSpecifity(String tissueSpecifity) {
        this.tissueSpecifity = tissueSpecifity;
    }

    public String getStringId() {
        return stringId;
    }

    public void setStringId(String stringId) {
        this.stringId = stringId;
    }

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

    public List<Receptor> getReceptorList() {
        return receptorList;
    }

    public void setReceptorList(List<Receptor> receptorList) {
        this.receptorList = receptorList;
    }

    public String getReceptorListStr() {
        return receptorListStr;
    }

    public void setReceptorListStr(String receptorListStr) {
        this.receptorListStr = receptorListStr;
    }
}
