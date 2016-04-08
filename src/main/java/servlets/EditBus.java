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
import java.util.List;

@WebServlet(value = "/management/editbus")
public class EditBus extends HttpServlet {

    @EJB
    BusDao busDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("WEB-INF/pages/editbus.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try{
            String action = request.getParameter("action");
            if(action.equals("select")){
                int index = new Integer(request.getParameter("busIndex"));
                List<Bus> buses = (List<Bus>) request.getAttribute("buses");
                request.setAttribute("bus", buses.get(index));
            }
            if (action.equals("edit")){
                int number = new Integer(request.getParameter("number"));
                String mark = request.getParameter("mark");
                String model = request.getParameter("model");
                String regNumber = request.getParameter("regNumber");
                boolean state = new Boolean(request.getParameter("state"));
                String description = request.getParameter("description");
                if (BusRegexMatches.busMatches(regNumber, mark, model, description)){
                    Bus bus = new Bus(number, regNumber, mark, model, state, description);
                    busDao.updateBus(bus);
                    response.sendRedirect("editbus");
                }
                else{
                    request.setAttribute("error", "Ошибка формата вводимых данных");
                }
            }
        }
        catch (NullPointerException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка работы с данными");
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

