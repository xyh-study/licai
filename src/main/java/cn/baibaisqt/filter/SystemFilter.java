package cn.baibaisqt.filter;

import cn.baibaisqt.domain.LicaiUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author xyh
 * @create 2022-01-12 22:32
 */
@WebFilter("/system/*")
public class SystemFilter implements Filter {

    private Logger logger = LoggerFactory.getLogger(SystemFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        logger.info("=====>开始进行用户验证");
        HttpServletRequest req= (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        HttpSession session = req.getSession();
        LicaiUser user = (LicaiUser) session.getAttribute("user");
        if(user == null){
            resp.sendRedirect(req.getContextPath()+"/index.jsp");
        }else{
            filterChain.doFilter(req,resp);
        }
    }

    @Override
    public void destroy() {

    }
}
