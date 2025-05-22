package com.infobookmart.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter(urlPatterns = {
    "/pages/home.jsp",
    "/pages/dashboard.jsp",
    "/pages/admin/*"
})
public class AuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // no-op
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // look for the same key your LoginController puts into session:
        Object user = req.getSession().getAttribute("currentUser");

        if (user == null) {
            // not logged in → force back to login page
            res.sendRedirect(req.getContextPath() + "/pages/login.jsp");
        } else {
            // logged in → let them through
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // no-op
    }
}