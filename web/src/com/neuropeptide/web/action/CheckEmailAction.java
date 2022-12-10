package com.neuropeptide.web.action;

import com.neuropeptide.entity.SubTab;
import com.neuropeptide.service.impl.DeleteServiceImpl;
import com.neuropeptide.service.impl.NPSearchServiceImpl;
import com.neuropeptide.tools.SimpleOrderManager;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class  CheckEmailAction extends BaseAction {
    private static final long serialVersionUID = 5491119577916849157L;

    public CheckEmailAction() {
    }

    public String execute() {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String email = request.getParameter("email");
        String activeCode = request.getParameter("checkString");
        String hql = "from com.neuropeptide.entity.SubTab t where t.email = '" + email + "'";
        NPSearchServiceImpl searchEmail = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
        new ArrayList();
        List list = searchEmail.search(hql);
        SubTab subTab = (SubTab) list.get(0);
        String relInfo;
        if (subTab.getActiveCode().equals(activeCode)) {
            relInfo = "update com.neuropeptide.entity.SubTab as s set s.isactive = 1 where s.email = '" + email + "'";
            DeleteServiceImpl update = (DeleteServiceImpl) this.getBean("delete");
            update.delete(relInfo);
            SimpleOrderManager simpleOrderManager = (SimpleOrderManager) this.getBean("orderManager");
            simpleOrderManager.placeOrder();
            relInfo = "Dear users, thank you for your submissions!<br />Your submissions (or updates) of the peptides will be considered for addition to the Neuropeptide Database !";
            request.setAttribute("relInfo", relInfo);
            return "submission";
        } else {
            relInfo = "Dear users, your submission is invalidate because of the failure of the confirmation, please confirm again !";
            request.setAttribute("relInfo", relInfo);
            return "submission";
        }
    }
}