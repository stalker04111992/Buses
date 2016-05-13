package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/*")
public class MainFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpServletRequest servletRequest = (HttpServletRequest)request;
        if(servletRequest.getSession().getAttribute("error") != null){
            servletRequest.setAttribute("error", servletRequest.getSession().getAttribute("error"));
            servletRequest.getSession().removeAttribute("error");
        }
        HttpServletResponse response1 = (HttpServletResponse)response;
        response1.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response1.setHeader("Pragma", "no-cache");
        response1.setDateHeader("Expires", 0);

        chain.doFilter(request, response);
    }

    public void destroy() {}
}