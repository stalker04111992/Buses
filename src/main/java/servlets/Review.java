package servlets;

import entities.Driver;
import service.DriverDao;
import servlets.entity.SearchingEntity;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/graph")
public class Review extends SearchingEntity {

    @EJB
    DriverDao driverDao;

    @Override
    protected void search(HttpServletRequest request) throws IOException, SQLException, NumberFormatException, NamingException, NullPointerException {
        ArrayList<Driver> drivers = search();
        request.setAttribute("drivers", print(drivers));
    }

    protected ArrayList<Driver> search() throws SQLException, NamingException{
        return driverDao.findAll();
    }
}
