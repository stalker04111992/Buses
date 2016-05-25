package servlets.drivers;

import entities.Driver;
import service.DriverDao;
import servlets.entity.EditionEntity;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

@WebServlet(value = "/management/drivers/edit")
public class Edition extends EditionEntity {
    @EJB
    DriverDao driverDao;

    @Override
    protected void select(HttpServletRequest request) throws IOException, SQLException, NamingException, NumberFormatException, NullPointerException{
        int number = new Integer(request.getParameter("number"));
        ArrayList<Driver> driver = driverDao.findByNumber(number);
        request.setAttribute("driver", print(driver));
    }

    @Override
    protected void edit(HttpServletRequest request) throws SQLException, ParseException, NumberFormatException, NullPointerException, EJBException{
        Driver driver = Driver.getDriver(request);
        String message = driverDao.updateDriver(driver) == 1 ? "Изменения сохранены" : "Изменения  не сохранены";
        request.getSession().setAttribute("error", message);
    }
}
