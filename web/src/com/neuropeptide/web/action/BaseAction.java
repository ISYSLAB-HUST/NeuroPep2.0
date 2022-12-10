package com.neuropeptide.web.action;

import com.opensymphony.xwork2.ActionSupport;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class BaseAction extends ActionSupport {
    private static final long serialVersionUID = -7630642085814030905L;

    public BaseAction() {
    }

    protected Object getBean(String id) {
        HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext sc = request.getSession().getServletContext();
        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
        return ctx.getBean(id);
    }
}

