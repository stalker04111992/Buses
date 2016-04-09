package servlets;

import entities.Bus;
import service.BusDao;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/management/editbus")
public class EditBus extends HttpServlet {

    @EJB
    BusDao busDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<Integer> numbers = busDao.getNumbers();
        request.setAttribute("numbers", numbers);
        request.getRequestDispatcher("WEB-INF/pages/editbus.jsp").forward(request, response);
    }
}

