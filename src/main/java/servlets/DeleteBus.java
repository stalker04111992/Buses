package servlets;

import service.BusDao;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

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
            request.setAttribute("error", "Произошла ошибка при отправке данных");
        }
        finally {
            request.getRequestDispatcher("WEB-INF/pages/deletebus.jsp").forward(request, response);
        }
    }
}
