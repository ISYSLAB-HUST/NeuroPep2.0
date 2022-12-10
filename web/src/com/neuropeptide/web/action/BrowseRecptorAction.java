package com.neuropeptide.web.action;

import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.ReceptorNew;
import com.neuropeptide.service.INPBasicService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Wclouds
 * @since 2021/7/27
 */
@Controller
public class BrowseRecptorAction extends ActionSupport {

    @Autowired
    private INPBasicService npBasicService;
    private static final long serialVersionUID = -5977004420785990805L;
    private Map<String, String> modification = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = -3186399032403080892L;

        {
//            this.put("Phosphorylation", "%Phosphorylation%");
//            this.put("Acetylation", "acetyl");
//            this.put("Sulfation", "Sulfotyrosine");
//            this.put("Pyroglutamination", "Pyrrolidone carboxylic acid");
            this.put("Phosphorylation", "%Phosphoserine%");
        }
    };

    public BrowseRecptorAction() {
    }

    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String type = request.getParameter("type");
        String phyla = request.getParameter("phyla");
        List organism;
        List phylaList;
        if (type.equals("family")) {
            organism = this.npBasicService.getAllRecFamily();
            request.setAttribute("family", organism);
        } else if (type.equals("organism")) {
            organism = this.npBasicService.getAllRecOrganism();
            request.setAttribute("organism", organism);
            phylaList = this.npBasicService.getAllRecPhyla();
            request.setAttribute("pList",phylaList);
        } else if (type.equals("modification")) {
            request.setAttribute("modification", this.modification);
        }

        if (type.equals("organism") && phyla != null){
            organism = this.npBasicService.getAllOrganismRecByPhyla(phyla);
            request.setAttribute("organism", organism);
            request.setAttribute("phyla",phyla);
        }

        //add neuro or receptor
        request.setAttribute("pType", "Receptor");
        request.setAttribute("proType", "Receptor");
        return "success";
    }

    //新增分类获取数据方法
    public String getPhylaData(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String phylaType = request.getParameter("phylaType");
//        LOG.info("成功调用");
//        LOG.info(phylaType);
//        request.setAttribute("phylaData", "phylaData");

        List organism;
        organism = this.npBasicService.getOrganismByPhyla(phylaType);
        //LOG.info(organism.toString());
        request.setAttribute("organism", organism);
        return "success";
    }

    public void splitToNeuroInfo(List<ReceptorNew> result){
        for (int i = 0; i <result.size() ; i++) {
            String neuroInfo = result.get(i).getNeuropeptide();
            String[] neuroInfoList = neuroInfo.split("\\$");
            String neuroInfo_s = "";
            String splitvalue = "split";

            for (int j = 0; j < neuroInfoList.length; j++) {
                if(j==neuroInfoList.length-1){
                    splitvalue="";
                }
                neuroInfo_s = neuroInfo_s+neuroInfoList[j].split("\\/\\/")[0]+splitvalue;
            }

            result.get(i).setNeuropeptide(neuroInfo_s);
//            System.out.println(receptorinfo_s);
        }
    }

    public String family() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        List<ReceptorNew> result = this.npBasicService.getAllRecByFaimly(name);
        splitToNeuroInfo(result);
        request.setAttribute("result", result);
        request.setAttribute("type", "family");
        request.setAttribute("pType", "Receptor");
        request.setAttribute("ppType", "recep");
        return "success";
    }

    public String organism() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        List<ReceptorNew> result = this.npBasicService.getAllRecyOrganism(name);
        splitToNeuroInfo(result);
        request.setAttribute("result", result);
        request.setAttribute("type", "organism");
        request.setAttribute("ppType", "recep");
        request.setAttribute("pType", "Receptor");
        return "success";
    }

    public String modification() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        List<ReceptorNew> result = this.npBasicService.getAllRecByModification((String) this.modification.get(name));
        splitToNeuroInfo(result);
        request.setAttribute("result", result);
        request.setAttribute("type", "modification");
        request.setAttribute("ppType", "recep");
        request.setAttribute("pType", "Receptor");
        request.setAttribute("proType", "Receptor");
        return "success";
    }
}