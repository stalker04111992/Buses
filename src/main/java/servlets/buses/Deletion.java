package servlets.buses;

import service.BusDao;
import servlets.entity.DeletionEntity;

import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@WebServlet(value = "/management/buses/delete")
public class Deletion extends DeletionEntity {

    @EJB
    BusDao busDao;

    @Override
    protected void delete(HttpServletRequest request)throws SQLException, NumberFormatException, NullPointerException{
        int number = new Integer(request.getParameter("number"));
        String message = busDao.delete(number) > 0 ? "Автобус удален из базы" : "Удаление не выполнено";
        request.getSession().setAttribute("error", message);
    }
}
