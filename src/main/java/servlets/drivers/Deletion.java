package servlets.drivers;

import service.DriverDao;
import servlets.entity.DeletionEntity;

import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@WebServlet(value = "/management/drivers/delete")
public class Deletion extends DeletionEntity {

    @EJB
    DriverDao driverDao;

    @Override
    protected void delete(HttpServletRequest request)throws SQLException, NumberFormatException, NullPointerException{
        int number = new Integer(request.getParameter("number"));
        String message = driverDao.delete(number) == 1 ? "Водитель удален из базы" : "Ошибка удаления";
        request.getSession().setAttribute("error", message);
    }
}
