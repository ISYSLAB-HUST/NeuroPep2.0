package com.neuropeptide.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:54
 * @Description:
 */
public class CXFFilter extends StrutsPrepareAndExecuteFilter {
    public CXFFilter() {
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        String url = ((HttpServletRequest) req).getRequestURI();
        if (url.contains("service")) {
            chain.doFilter(req, res);
        } else {
            super.doFilter(req, res, chain);
        }

    }
}
