package com.neuropeptide.web.action;

import com.neuropeptide.service.impl.DeleteServiceImpl;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class DeleteAction extends BaseAction {
    private static final long serialVersionUID = 1038796503967364978L;

    public DeleteAction() {
    }

    public String execute() throws Exception {
        return "success";
    }

    public String delSub() {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        int subID = Integer.parseInt(request.getParameter("subID"));
        String hqlDel = "delete com.neuropeptide.entity.SubTab as s where s.id = " + subID;
        DeleteServiceImpl delete = (DeleteServiceImpl) this.getBean("delete");
        delete.delete(hqlDel);
        return "allSubmission";
    }
}

