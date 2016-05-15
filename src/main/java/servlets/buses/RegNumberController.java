package servlets.buses;

import service.BusDao;
import servlets.entity.SearchingController;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

@WebServlet(value = "/management/buses/control")
public class RegNumberController extends SearchingController{

    @EJB
    BusDao busDao;

    protected int search(HttpServletRequest request)throws ParseException, IOException, SQLException, NumberFormatException, NamingException, NullPointerException{
        String regNumber = request.getParameter("regNumber");
        int number = new Integer(request.getParameter("number"));
        return busDao.getCountsBuses(number, regNumber);
    }
}
