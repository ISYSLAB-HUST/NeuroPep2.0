package com.neuropeptide.tools;

import com.neuropeptide.entity.NPTab;

import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:56
 * @Description:
 */
public class DataSyncXml {
    public DataSyncXml() {
    }

    public String personListXml(List pl) {
        Document doc = DocumentHelper.createDocument();
        Element neuropeptideList = doc.addElement("NeuropeptideList");

        for (int i = 0; i < pl.size(); ++i) {
            NPTab neuropeptide = (NPTab) pl.get(i);
            Element p = neuropeptideList.addElement("neuropeptide");
            p.addElement("id").addText(this.object2String(neuropeptide.getId()));
            p.addElement("accessNum").addText(this.object2String(neuropeptide.getAccessNum()));
            p.addElement("name").addText(this.object2String(neuropeptide.getName()));
            p.addElement("sequence").addText(this.object2String(neuropeptide.getSequence()));
            p.addElement("length").addText(this.object2String(neuropeptide.getLength()));
            p.addElement("organism").addText(this.object2String(neuropeptide.getOrganism()));
        }

        return doc.asXML();
    }

    private String object2String(Object o) {
        return o == null ? "" : o.toString();
    }
}