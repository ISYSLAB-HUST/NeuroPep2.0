package com.neuropeptide.web.action;

import com.neuropeptide.entity.UserInfo;
import com.neuropeptide.service.IUserInfoService;
import com.neuropeptide.service.impl.NPSearchServiceImpl;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class LoginAction extends BaseAction {
    private static final long serialVersionUID = -8995266188700328441L;

    public LoginAction() {
    }

    public String execute() throws Exception {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        IUserInfoService service = (IUserInfoService) this.getBean("login");
        String username = "";
        String password = "";
        String status = "";
        UserInfo sessionUser = (UserInfo) request.getSession().getAttribute("user");
        if (request.getParameter("username") != null && request.getParameter("password") != null) {
            username = request.getParameter("username");
            request.setAttribute("username", username);
            password = request.getParameter("password");
            request.setAttribute("password", password);
            status = service.verifyPassword(username, password);
        } else if (sessionUser != null && sessionUser.getUsername() != null && sessionUser.getPassword() != null) {
            username = sessionUser.getUsername();
            password = sessionUser.getPassword();
            status = service.verifyPassword(username, password);
        }

        if ("00000".equals(status)) {
            UserInfo user = service.findByLoginName(username);
            request.getSession().setAttribute("user", user);
            String hql = "from com.neuropeptide.entity.SubTab s";
            NPSearchServiceImpl manager = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
            new ArrayList();
            List list = manager.search(hql);
            request.setAttribute("aaData", list);
            return "displaySub";
        } else if ("10003".equals(status)) {
            request.setAttribute("errorMsg", "please check the username and password !");
            return "logout";
        } else {
            return "logout";
        }
    }
}

