package com.neuropeptide.web.action;

import com.neuropeptide.service.impl.NPSearchServiceImpl;
import com.neuropeptide.service.impl.SiteInfoService;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.transaction.annotation.Transactional;

public class DataViewAction extends BaseAction {
    private static final long serialVersionUID = 4587516790964492690L;

    public DataViewAction() {
    }

    @Transactional
    public String execute() throws Exception {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String value = request.getParameter("value");
        HttpServletResponse response = null;
        response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        SiteInfoService siteInfoService;
        ObjectMapper objectMapper;
        if (value.equals("2")) {
            siteInfoService = (SiteInfoService) this.getBean("siteInfoService");
            objectMapper = new ObjectMapper();
            out.write(objectMapper.writeValueAsString(siteInfoService.getLengthDistribution()));
            out.flush();
            out.close();
            return null;
        } else if (value.equals("0")) {
            siteInfoService = (SiteInfoService) this.getBean("siteInfoService");
            objectMapper = new ObjectMapper();
            out.write(objectMapper.writeValueAsString(siteInfoService.getOrganismDistribution()));
            out.flush();
            out.close();
            return null;
        } else {
            JSONArray jsonData;
            NPSearchServiceImpl lenDistribution;
            if (value.equals("1")) {
                lenDistribution = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
                jsonData = lenDistribution.searchOrgaDistr();
                out.write(jsonData.toString());
                out.flush();
                out.close();
                return null;
            } else if (value.equals("3")) {
                lenDistribution = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
                jsonData = lenDistribution.searchSourDistr();
                out.write(jsonData.toString());
                out.flush();
                out.close();
                return null;
            } else {
                JSONArray s = new JSONArray();
                s.add("hefeng");
                out.write(s.toString());
                out.flush();
                out.close();
                return null;
            }
        }
    }
}
