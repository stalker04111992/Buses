package servlets.buses;

import entities.Bus;
import service.BusDao;
import servlets.entity.ProfileEntity;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/management/buses/profile")
public class Profile extends ProfileEntity {

    @EJB
    BusDao busDao;

    @Override
    protected void profile(HttpServletRequest request) throws IOException, SQLException, NamingException, NullPointerException{
        int number = new Integer(request.getParameter("number"));
        ArrayList<Bus> bus = busDao.findByNumber(number);
        request.setAttribute("bus", print(bus));
    }
}
