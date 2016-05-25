package servlets.buses;

import entities.Bus;
import service.BusDao;
import servlets.entity.EditionEntity;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/management/buses/edit")
public class Edition extends EditionEntity {
    @EJB
    BusDao busDao;

    @Override
    protected void select(HttpServletRequest request) throws IOException, SQLException, NamingException, NumberFormatException, NullPointerException{
        int number = new Integer(request.getParameter("number"));
        ArrayList<Bus> bus = busDao.findByNumber(number);
        request.setAttribute("bus", print(bus));
    }

    @Override
    protected void edit(HttpServletRequest request) throws SQLException, NumberFormatException, NullPointerException, EJBException{
        Bus bus = Bus.createBus(request);
        String message = busDao.updateBus(bus) > 0 ? "Изменения сохранены" : "Изменения не сохранены";
        request.getSession().setAttribute("error", message);
    }
}
