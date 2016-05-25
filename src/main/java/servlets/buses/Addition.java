package servlets.buses;

import entities.Bus;
import service.BusDao;

import servlets.entity.AdditionEntity;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@WebServlet(value = "/management/buses/add")
public class Addition extends AdditionEntity {

    @EJB
    private BusDao busDao;

    protected void add(HttpServletRequest request)throws NumberFormatException, SQLException, EJBException, NullPointerException{
        Bus bus = Bus.createBus(request);
        String message = busDao.saveBus(bus) == 1 ? "Автобус успешно добавлен" : "Ошибка добавления в базу данных";
        request.getSession().setAttribute("error", message);
    }
}
