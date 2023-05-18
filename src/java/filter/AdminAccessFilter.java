package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/admin/*", initParams = {
        @WebInitParam(name = "paramName", value = "paramValue")
})
public class AdminAccessFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Check user role
        String userRole = (String) httpRequest.getSession().getAttribute("role");

        if (!"admin".equals(userRole)) {
            httpRequest.getSession().invalidate();
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/index.jsp?restrict=true");
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }


}
