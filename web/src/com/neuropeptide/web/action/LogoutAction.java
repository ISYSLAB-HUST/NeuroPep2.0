package com.neuropeptide.web.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class LogoutAction extends BaseAction {
    private static final long serialVersionUID = -1964460503494681698L;

    public LogoutAction() {
    }

    public String execute() {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        request.getSession().removeAttribute("user");
        request.getSession().invalidate();
        return "logout";
    }
}
