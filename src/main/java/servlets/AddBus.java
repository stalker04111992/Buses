package servlets;

import entities.Bus;
import service.BusDao;
import service.BusRegexMatches;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/management/addbus")
public class AddBus extends HttpServlet{
    @EJB
    BusDao busDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("WEB-INF/pages/addbus.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        try{
            Bus bus = BusRegexMatches.getBus(request);
            if (bus == null){
                throw new NullPointerException();
            }
            busDao.saveBus(bus);
            response.sendRedirect("addbus");
        }
        catch (SQLException exception){
            request.setAttribute("error", "Произошла ошибка при работе с базой данных");
            request.getRequestDispatcher("WEB-INF/pages/addbus.jsp").forward(request, response);
        }
        catch (NullPointerException exception){
            request.setAttribute("error", "Ошибка формата вводимых данных");
            request.getRequestDispatcher("WEB-INF/pages/addbus.jsp").forward(request, response);
        }
    }
}
