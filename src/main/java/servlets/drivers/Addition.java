package servlets.drivers;

import entities.Driver;
import service.DriverDao;
import servlets.entity.AdditionEntity;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.text.ParseException;

@WebServlet(value = "/management/drivers/add")
public class Addition extends AdditionEntity {

    @EJB
    DriverDao driverDao;

    @Override
    protected void add(HttpServletRequest request)throws NumberFormatException, ParseException, SQLException, EJBException, NullPointerException {
        Driver driver = Driver.getDriver(request);
        String message = driverDao.saveDriver(driver) == 1 ? "Водитель успешно добавлен" : "Ошибка добавления в базу данных";
        request.getSession().setAttribute("error", message);
    }
}
