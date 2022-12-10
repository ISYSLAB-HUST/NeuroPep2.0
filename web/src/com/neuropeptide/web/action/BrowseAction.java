package com.neuropeptide.web.action;

import com.neuropeptide.entity.NPTab;
import com.neuropeptide.service.INPBasicService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BrowseAction extends ActionSupport {
    @Autowired
    private INPBasicService npBasicService;
    private static final long serialVersionUID = -6219258405096820276L;
    private Map<String, String> modification = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = 6534958789052623727L;

        {
            this.put("Amidation", "Amide");
            this.put("Acetylation", "acetyl");
            this.put("Sulfation", "Sulfotyrosine");
            this.put("Pyroglutamination", "Pyrrolidone carboxylic acid");
            this.put("Phosphorylation", "Phosphoserine");
        }
    };

    public BrowseAction() {
    }

    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String type = request.getParameter("type");
        String phyla = request.getParameter("phyla");
        List organism;
        List phylaList;
        if (type.equals("family")) {
            organism = this.npBasicService.getAllFamily();
            request.setAttribute("family", organism);
        } else if (type.equals("organism")) {
            organism = this.npBasicService.getAllOrganism();
            request.setAttribute("organism", organism);
            phylaList = this.npBasicService.getAllPhyla();
            request.setAttribute("pList",phylaList);
        } else if (type.equals("modification")) {
            request.setAttribute("modification", this.modification);
        }

        if (type.equals("organism") && phyla != null){
            organism = this.npBasicService.getAllOrganismByPhyla(phyla);
            request.setAttribute("organism", organism);
            request.setAttribute("phyla",phyla);
        }

        //add neuro or receptor
        //request.setAttribute("pType", "Neuropeptide");
        request.setAttribute("proType", "Neuropeptide");

        /*//add receptor's method which get all family
        if (type.equals("recFamily")){
            organism = this.npBasicService.getAllRecFamily();
            request.setAttribute("family",organism);
        }else if (type.equals("recOrganism")){
            organism = this.npBasicService.getAllRecOrganism();
            request.setAttribute("organism",organism);
        }*/




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
        LOG.info(organism.toString());
        request.setAttribute("organism", organism);
        return "success";
    }


    public void splitToReceptorInfo(List<NPTab> result){
        for (int i = 0; i <result.size() ; i++) {
            String receptorinfo = result.get(i).getReceptor();
            String[] receptorsList = receptorinfo.split("\\$");
            String receptorinfo_s = "";
            String splitvalue = "split";

            for (int j = 0; j < receptorsList.length; j++) {
                if(j==receptorsList.length-1){
                    splitvalue="";
                }
                receptorinfo_s = receptorinfo_s+receptorsList[j].split("\\/\\/")[0]+splitvalue;
            }
            result.get(i).setReceptor(receptorinfo_s);
        }
    }

    public String family() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        List<NPTab> result = this.npBasicService.getAllNPByFaimly(name);
//        for (int i = 0; i <result.size() ; i++) {
////            String receptorinfo = result.get(i).getReceptor();
////            String receptorinfo_s = receptorinfo.split("\\/\\/")[0];
////            result.get(i).setReceptor(receptorinfo_s);
//////            System.out.println(receptorinfo_s);
////        }
        splitToReceptorInfo(result);
//            String receptorinfo = npb.getReceptor();
//            String receptorinfo_s = receptorinfo.split("\\/\\/")[0];
//            System.out.println(receptorinfo_s);
//        }
        request.setAttribute("result", result);
        request.setAttribute("type", "family");
        request.setAttribute("ppType", "neuro");
        return "success";
    }

    public String organism() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        List<NPTab> result = this.npBasicService.getAllNPByOrganism(name);
        splitToReceptorInfo(result);
        request.setAttribute("result", result);
        request.setAttribute("type", "organism");
        request.setAttribute("ppType", "neuro");
        return "success";
    }

    public String modification() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        List<NPTab> result = this.npBasicService.getAllNPByModification((String) this.modification.get(name));
        splitToReceptorInfo(result);
        request.setAttribute("result", result);
        request.setAttribute("type", "modification");
        request.setAttribute("ppType", "neuro");
        return "success";
    }



}
