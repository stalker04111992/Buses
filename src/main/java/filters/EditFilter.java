package filters;

import entities.Bus;
import service.BusDao;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebFilter(value = {"/management/editbus", "/management/deletebus"})
public class EditFilter implements Filter {
    @EJB
    BusDao busDao;
    private ArrayList<Bus> buses;

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        getBusInformation(request);
        chain.doFilter(request, response);
    }

    private void getBusInformation(ServletRequest request){
        try{
            buses = busDao.findAll();
            request.setAttribute("buses", buses);
        }
        catch (SQLException exception){
            request.setAttribute("error", "Ошибка подключения к базе данных");
            exception.printStackTrace();
        }
        catch (NamingException exception){
            request.setAttribute("error", "Ошибка запроса к базе данных");
            exception.printStackTrace();
        }
    }


    public void destroy() {
        buses = null;
    }
}
