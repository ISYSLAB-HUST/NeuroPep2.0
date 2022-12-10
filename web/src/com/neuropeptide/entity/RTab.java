package com.neuropeptide.entity;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;
import java.util.Map;


public class RTab {
    private int id;
    private String accessNum;
    private String name;
    private String sequence;
    private int length;
    private String family;
    private String organism;
    private String orginal_form;
    private String source;
    private String pdb;
    private String modification;
    private float mw;
    private float pi;
    private String family_short;
    private Integer Taxa_ID;
    private String UnitProt_ID;
    private String OR_type;
    private String goinfo;
    private String gene_Family;
    private String pmid;
    private String phyla;
    private String Peptide_REF;
    private String TISSUE_SPECIFITY;

    private String pubmedId;
    private String neuropeptide;
    private Integer taxaId;
    private String lineage;
    private String function;
    private String tissueSpecifity;
    private String stringId;

    private List<Map<String, Object>> nodes;

    private List<Map<String, Object>> lines;

    private String nodesStr;
    private String linesStr;

    private String drugbank;
    private String chEMBL;
    private String drugCentral;

    private String np_ids;
    private String predictASA;
    private String complexPdb;
    private String reactome;
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



    private String gene;
    private String guidetop;

    public String getGuidetop() {
        return guidetop;
    }

    public void setGuidetop(String guidetop) {
        this.guidetop = guidetop;
    }

    public String getGene() {
        return gene;
    }

    public void setGene(String gene) {
        this.gene = gene;
    }



    public String getNp_ids() {
        return np_ids;
    }

    public void setNp_ids(String np_ids) {
        this.np_ids = np_ids;
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

    private String realASA;

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



    public String getChEMBL() {
        return chEMBL;
    }

    public void setChEMBL(String chEMBL) {
        this.chEMBL = chEMBL;
    }

    public String getDrugbank() {
        return drugbank;
    }

    public void setDrugbank(String drugbank) {
        this.drugbank = drugbank;
    }

    private List<Neuropeptide> neuropeptideList;

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

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
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

    public String getOrginal_form() {
        return orginal_form;
    }

    public void setOrginal_form(String orginal_form) {
        this.orginal_form = orginal_form;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
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

    public float getMw() {
        return mw;
    }

    public void setMw(float mw) {
        this.mw = mw;
    }

    public float getPi() {
        return pi;
    }

    public void setPi(float pi) {
        this.pi = pi;
    }

    public String getFamily_short() {
        return family_short;
    }

    public void setFamily_short(String family_short) {
        this.family_short = family_short;
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

    public String getGene_Family() {
        return gene_Family;
    }

    public void setGene_Family(String gene_Family) {
        this.gene_Family = gene_Family;
    }

    public String getPmid() {
        return pmid;
    }

    public void setPmid(String pmid) {
        this.pmid = pmid;
    }

    public String getPhyla() {
        return phyla;
    }

    public void setPhyla(String phyla) {
        this.phyla = phyla;
    }

    public String getPeptide_REF() {
        return Peptide_REF;
    }

    public void setPeptide_REF(String peptide_REF) {
        Peptide_REF = peptide_REF;
    }

    public String getTISSUE_SPECIFITY() {
        return TISSUE_SPECIFITY;
    }

    public void setTISSUE_SPECIFITY(String TISSUE_SPECIFITY) {
        this.TISSUE_SPECIFITY = TISSUE_SPECIFITY;
    }

    public String getPubmedId() {
        return pubmedId;
    }

    public void setPubmedId(String pubmedId) {
        this.pubmedId = pubmedId;
    }

    public String getNeuropeptide() {
        return neuropeptide;
    }

    public void setNeuropeptide(String neuropeptide) {
        this.neuropeptide = neuropeptide;
    }

    public Integer getTaxaId() {
        return taxaId;
    }

    public void setTaxaId(Integer taxaId) {
        this.taxaId = taxaId;
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

    public List<Neuropeptide> getNeuropeptideList() {
        return neuropeptideList;
    }

    public void setNeuropeptideList(List<Neuropeptide> neuropeptideList) {
        this.neuropeptideList = neuropeptideList;
    }

    public String getNeuropeptideListStr() {
        return neuropeptideListStr;
    }

    public void setNeuropeptideListStr(String neuropeptideListStr) {
        this.neuropeptideListStr = neuropeptideListStr;
    }

    private String neuropeptideListStr;

    @Override
    public String toString() {
        return "RTab{" +
                "id=" + id +
                ", accessNum='" + accessNum + '\'' +
                ", name='" + name + '\'' +
                ", sequence='" + sequence + '\'' +
                ", length=" + length +
                ", family='" + family + '\'' +
                ", organism='" + organism + '\'' +
                ", orginal_form='" + orginal_form + '\'' +
                ", source='" + source + '\'' +
                ", pdb='" + pdb + '\'' +
                ", modification='" + modification + '\'' +
                ", mw=" + mw +
                ", pi=" + pi +
                ", family_short='" + family_short + '\'' +
                ", Taxa_ID=" + Taxa_ID +
                ", UnitProt_ID='" + UnitProt_ID + '\'' +
                ", OR_type='" + OR_type + '\'' +
                ", goinfo='" + goinfo + '\'' +
                ", gene_Family='" + gene_Family + '\'' +
                ", pmid='" + pmid + '\'' +
                ", phyla='" + phyla + '\'' +
                ", Peptide_REF='" + Peptide_REF + '\'' +
                ", TISSUE_SPECIFITY='" + TISSUE_SPECIFITY + '\'' +
                ", pubmedId='" + pubmedId + '\'' +
                ", neuropeptide='" + neuropeptide + '\'' +
                ", taxaId=" + taxaId +
                ", lineage='" + lineage + '\'' +
                ", function='" + function + '\'' +
                ", tissueSpecifity='" + tissueSpecifity + '\'' +
                ", stringId='" + stringId + '\'' +
                ", nodes=" + nodes +
                ", lines=" + lines +
                ", nodesStr='" + nodesStr + '\'' +
                ", linesStr='" + linesStr + '\'' +
                ", neuropeptideList=" + neuropeptideList +
                ", neuropeptideListStr='" + neuropeptideListStr + '\'' +
                '}';
    }

    public RTab() {
    }

}
