package servlets.drivers;

import entities.Driver;
import service.DriverDao;
import servlets.entity.ProfileEntity;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/management/drivers/profile")
public class Profile extends ProfileEntity {

    @EJB
    DriverDao driverDao;

    @Override
    protected void profile(HttpServletRequest request) throws IOException, SQLException, NamingException, NullPointerException{
        int number = new Integer(request.getParameter("number"));
        ArrayList<Driver> driver = driverDao.findByNumber(number);
        request.setAttribute("driver", print(driver));
    }
}
