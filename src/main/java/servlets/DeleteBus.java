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

@WebServlet(value = "/management/deletebus")
public class DeleteBus extends HttpServlet{
    @EJB
    BusDao busDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("WEB-INF/pages/deletebus.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        addBus(request, response);
    }

    private void addBus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        try{
            int index = new Integer(request.getParameter("busIndex"));
            busDao.delete(index);
            response.sendRedirect("deletebus");
        }
        catch(SQLException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Произошла ошибка при работе с базой данных");
        }
        catch (NullPointerException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Произошла ошибка при передаче данных");
        }
        finally {
            request.getRequestDispatcher("WEB-INF/pages/deletebus.jsp").forward(request, response);
        }
    }
}
