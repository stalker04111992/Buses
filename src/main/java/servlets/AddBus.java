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
        addBus(request, response);
    }

    private void addBus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        try{
            String mark = request.getParameter("mark");
            String model = request.getParameter("model");
            String regNumber = request.getParameter("regNumber");
            boolean state = new Boolean(request.getParameter("state"));
            String description = request.getParameter("description");
            if (BusRegexMatches.busMatches(regNumber, mark, model, description)){
                Bus bus = new Bus(regNumber, mark, model, state, description);
                List result = busDao.findByRegNumber(regNumber);
                if(result.isEmpty()){
                    busDao.saveBus(bus);
                    request.setAttribute("error", "Автобус в базу добавлен успешно");
                }
                else{
                    request.setAttribute("error", "Регистрационный номер уже существует");
                }
            }
            else{
                request.setAttribute("error", "Ошибка формата вводимых данных");
            }
        }
        catch(NamingException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Невозможно создать подключение");
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
            request.getRequestDispatcher("WEB-INF/pages/addbus.jsp").forward(request, response);
        }
    }
}
