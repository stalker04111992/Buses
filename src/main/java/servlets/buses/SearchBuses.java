package servlets.buses;

import entities.Bus;
import service.buses.BusDao;
import service.buses.BusRegexMatches;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/management/buses/searchbuses")
public class SearchBuses extends HttpServlet {

    @EJB
    BusDao busDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        search(request);
        request.getRequestDispatcher("WEB-INF/pages/viewvacancies.jsp").forward(request, response);
    }

    private void search(HttpServletRequest request){
        try{
            int param = new Integer(request.getParameter("search"));
            String line = request.getParameter("line");
            ArrayList<Bus> buses = null;
            switch (param){
                case 0:{
                    int number = new Integer(line);
                    buses = busDao.findByNumber(number);
                    break;
                }
                case 1:{
                    if (BusRegexMatches.regNumberMatches(line)){
                        buses = busDao.findByRegNumber(line);
                    }
                    else{
                        throw new NamingException();
                    }
                    break;
                }
                case 2:{
                    if(BusRegexMatches.markMatches(line)){
                        buses = busDao.findByMark(line);
                    }
                    else{
                        throw new NamingException();
                    }
                    break;
                }
                case 3:{
                    buses = busDao.findAll();
                    break;
                }
            }
            request.setAttribute("buses", buses);
            request.setAttribute("search", param);
        }
        catch (NullPointerException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка в параметрах");
        }
        catch (SQLException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка подключения к базе данных");
        }
        catch (NamingException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Неверный формат данных");
        }
        catch (NumberFormatException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Неверный формат данных");
        }
    }
}
