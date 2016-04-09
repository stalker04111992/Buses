package servlets;

import entities.Bus;
import service.BusDao;
import service.BusRegexMatches;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(value = "/management/updatebus")
public class UpdateBus extends HttpServlet {
    @EJB
    BusDao busDao;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try{
            int number = new Integer(request.getParameter("number"));
            Bus bus = busDao.findByNumber(number);
            request.setAttribute("selectedBus", bus);
        }
        catch (SQLException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка подключения к базе данных");
        }
        catch (NamingException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка запроса к базе данных");
        }
        catch (NullPointerException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка. Данные не найдены");
        }
        finally {
            request.getRequestDispatcher("WEB-INF/pages/editbus.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try{
            Bus bus = BusRegexMatches.getBus(request);
            busDao.updateBus(bus);
            response.sendRedirect("editbus");
        }
        catch (NullPointerException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка формата данных");
        }
        catch(SQLException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Произошла ошибка при работе с базой данных");
        }
        finally {
            request.getRequestDispatcher("WEB-INF/pages/editbus.jsp").forward(request, response);
        }
    }
}
