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

@WebServlet(value = "/management/viewbuses")
public class ViewBuses extends HttpServlet {
    @EJB
    BusDao busDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        viewbuses(request, response);
        request.getRequestDispatcher("WEB-INF/pages/viewbuses.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

    }

    private void viewbuses(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String param = request.getParameter("search");
            if (param != null) {
                List<Bus> buses = null;
                if (param.equals("all")) {
                    buses = busDao.findAll();
                }
                if (param.equals("marks")) {
                    String mark = request.getParameter("mark");
                    if(BusRegexMatches.markMatches(mark)){
                        buses = busDao.findByMark(mark);
                    }
                }
                if (param.equals("numbers")) {
                    String regNumber = request.getParameter("number");
                    if(BusRegexMatches.regNumberMatches(regNumber)){
                        buses = busDao.findByRegNumber(regNumber);
                    }
                }
                request.setAttribute("buses", buses);
            }
        } catch (NamingException exception) {
            exception.printStackTrace();
            request.setAttribute("error", "Невозможно создать подключение");
        } catch (SQLException exception) {
            request.setAttribute("error", "Ошибка при выполнении запроса базе данных");
        } catch (NullPointerException exception) {
            request.setAttribute("error", "Сбой в работе базы данных");
        } finally {
            request.getRequestDispatcher("WEB-INF/pages/viewbuses.jsp").forward(request, response);
        }
    }
}
