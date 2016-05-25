package filters;

import entities.Bus;
import service.buses.BusDao;
import service.buses.BusRegexMatches;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebFilter(urlPatterns = {"/management/buses/add", "/management/buses/edit", "/management/buses/view", "/management/buses/search", "/management/buses/delete", "/management/buses/profile"})
public class VacanciesFilter implements Filter {

    @EJB
    BusDao busDao;

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try{
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            String uri = httpRequest.getServletPath();
            uri = uri.replace("/management/buses/", "");
            if(httpRequest.getMethod().equalsIgnoreCase("get")){
                get(httpRequest, uri);
            }
            if(httpRequest.getMethod().equalsIgnoreCase("post")){
                post(httpRequest, httpResponse, uri);
            }
        }
        catch (SQLException exception){
            request.setAttribute("error", "Произошла ошибка при работе с базой данных");
        }
        catch (NamingException exception){
            request.setAttribute("error", "Ошибка запроса к базе данных");
        }
        catch (NullPointerException exception){
            request.setAttribute("error", "Ошибка при передаче данных");
        }
        catch (NumberFormatException exception){
            request.setAttribute("error", "Ошибка формата данных данных");
        }
        finally {
            chain.doFilter(request, response);
        }
    }

    private void get(HttpServletRequest request, String uri) throws SQLException, NamingException, NullPointerException{
        if (uri.equals("edit")){
            int number = new Integer(request.getParameter("number"));
            Bus bus = busDao.findByNumber(number).get(0);
            request.setAttribute("bus", bus);
        }
        if(uri.equals("search")){
            int param = new Integer(request.getParameter("search"));
            String line = request.getParameter("line");
            ArrayList<Bus> buses = search(param, line);
            request.setAttribute("buses", buses);
        }
        if(uri.equals("profile")){
            int number = new Integer(request.getParameter("selected"));
            Bus bus = busDao.findByNumber(number).get(0);
            request.setAttribute("bus", bus);
        }
    }

    private void post(HttpServletRequest request, HttpServletResponse response, String uri)throws SQLException, IOException, NullPointerException{
        if(uri.equals("add")){
            Bus bus = BusRegexMatches.getBus(request);
            busDao.saveBus(bus);
            response.sendRedirect("../../management");
        }
        if(uri.equals("edit")){
            Bus bus = BusRegexMatches.getBus(request);
            busDao.updateBus(bus);
            response.sendRedirect("view");
        }
        if(uri.equals("delete")){
            busDao.delete(new Integer(request.getParameter("number")));
            response.sendRedirect("view");
        }
    }

    private ArrayList<Bus> search(int param, String line) throws SQLException, NamingException{
        switch (param){
            case 0:{
                int number = new Integer(line);
                return busDao.findByNumber(number);
            }
            case 1:{
                if (BusRegexMatches.regNumberMatches(line)){
                    return busDao.findByRegNumber(line);
                }
            }
            case 2:{
                if(BusRegexMatches.markMatches(line)){
                    return busDao.findByMark(line);
                }
            }
            case 3:{
                return busDao.findAll();
            }
        }
        return  null;
    }


    public void destroy() {

    }
}
