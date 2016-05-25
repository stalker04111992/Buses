package servlets;

import entities.Bus;
import service.BusDao;
import servlets.entity.SearchingEntity;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/buses")
public class AllBuses extends SearchingEntity {
    @EJB
    BusDao busDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            search(request);
        } catch (Exception exception) {
            request.getSession().setAttribute("error", handle(exception));
        }
        request.getRequestDispatcher("WEB-INF/pages/buses.jsp").forward(request, response);
    }

    @Override
    protected void search(HttpServletRequest request) throws IOException, SQLException, NumberFormatException, NamingException, NullPointerException{
        ArrayList<Bus> buses = search();
        request.setAttribute("buses", print(buses));
    }

    private ArrayList<Bus> search() throws SQLException, NumberFormatException, NamingException{
        return busDao.findAll();
    }
}
