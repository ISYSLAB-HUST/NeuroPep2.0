package com.neuropeptide.web.action;

import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.SubTab;
import com.neuropeptide.service.impl.DeleteServiceImpl;
import com.neuropeptide.service.impl.NPSearchServiceImpl;
import com.neuropeptide.service.impl.SaveServiceImpl;
import com.neuropeptide.tools.PropertiesFactoryHelper;
import com.neuropeptide.tools.ProteinUtilities;
import com.neuropeptide.tools.SimpleOrderManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class SaveAction extends BaseAction {
    private static final long serialVersionUID = -4316797843643031606L;
    PropertiesFactoryHelper propeties = PropertiesFactoryHelper.getInstance();

    public SaveAction() {
    }

    public String execute() throws Exception {
        return "success";
    }

    public String submission() throws IOException {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        System.out.println(basePath);
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String sequence = request.getParameter("sequence").toUpperCase().trim();
        int length = sequence.length();
        String organism = request.getParameter("organism").trim();
        String family = request.getParameter("family").trim();
        String phyla = request.getParameter("phyla").trim();
        String tissue_specificity = request.getParameter("tissue_specificity").trim();
        String uniprotAcc = request.getParameter("uniprotAcc").trim();
        String description = request.getParameter("description").trim();
        String category = request.getParameter("category").trim();
        String relInfo = "Dear users, thank you for your submissions!<br />Your submissions (or updates) of the peptides will be considered for addition to the Neuropeptide Database !";
        HttpServletResponse response = null;
        response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        out.write(relInfo);
        out.flush();
        out.close();
        SubTab submission = new SubTab();
        submission.setCategory(category);
        submission.setEmail(email);
        submission.setName(name);
        submission.setSequence(sequence);
        submission.setLength(length);
        submission.setOrganism(organism);
        submission.setFamily(family);
        submission.setPhyla(phyla);
        submission.setTissue_specificity(tissue_specificity);
        submission.setUniprotAcc(uniprotAcc);
        submission.setDescription(description);
        submission.setIsactive(1);
        SaveServiceImpl manager = (SaveServiceImpl) this.getBean("save");
        manager.saveSubmission(submission);
        SimpleOrderManager simpleOrderManager = (SimpleOrderManager) this.getBean("orderManager");
        simpleOrderManager.placeOrder();
        return null;
    }

    public String approval() {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        String sequence = request.getParameter("sequence").toUpperCase().trim();
        int length = Integer.parseInt(request.getParameter("length"));
        String organism = request.getParameter("organism_group");
        String family = request.getParameter("family_group");
        String uniprotAcc = request.getParameter("uniprot");
        String phyla = request.getParameter("phyla");
        String tissue_specificity = request.getParameter("tissue_specificity");
        int subID = Integer.parseInt(request.getParameter("subID"));
        String hqlMax = "select accessNum from com.neuropeptide.entity.NPTab ORDER BY id DESC LIMIT 1";
        NPSearchServiceImpl searchMax = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
        new ArrayList();
        List list = searchMax.search(hqlMax);
        String maxAccessNum = (String) list.get(0);
        int digitPosition = Integer.parseInt(maxAccessNum.substring(2)) + 1;
        String accession_number = "NP";
        if (digitPosition > 9999) {
            accession_number = accession_number + digitPosition;
        } else {
            accession_number = accession_number + "0" + digitPosition;
        }

        ProteinUtilities proteinUtil = new ProteinUtilities();
        String prueSequence = ProteinUtilities.getPureSequence(sequence);
        NPTab approval = new NPTab();
        approval.setAccessNum(accession_number);
        approval.setName(name);
        approval.setSequence(sequence);
        approval.setOrganism(organism);
        approval.setFamily(family);
        approval.setLength(prueSequence.length());
        approval.setPhyla(phyla);
        approval.setTISSUE_SPECIFITY(tissue_specificity);
        approval.setMw(proteinUtil.getProteinMW(prueSequence));
        approval.setPi(proteinUtil.getProteinPI(prueSequence));
        SaveServiceImpl save = (SaveServiceImpl) this.getBean("save");
        save.saveApproval(approval);
        String hqlDel = "delete com.neuropeptide.entity.SubTab as s where s.id = " + subID;
        DeleteServiceImpl delete = (DeleteServiceImpl) this.getBean("delete");
        delete.delete(hqlDel);
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("MMMM dd'th' yyyy", Locale.ENGLISH);
        String update = sdf.format(date);
        String hqlUpdate = "update com.neuropeptide.entity.UserInfo as u set u.update_time= '" + update + "'";
        DeleteServiceImpl updateManager = (DeleteServiceImpl) this.getBean("delete");
        updateManager.delete(hqlUpdate);
        return "allSubmission";
    }
}

