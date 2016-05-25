package servlets.table;

import entities.Bus;
import service.BusDao;
import servlets.entity.SearchingPrint;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

@WebServlet(value = "/management/table/buses")
public class SelectBuses extends SearchingPrint {

    @EJB
    BusDao busDao;

    @Override
    protected ArrayList<Bus> search(HttpServletRequest request) throws ParseException, IOException, SQLException, NumberFormatException, NamingException, NullPointerException {
        int shift = new Integer(request.getParameter("shift"));
        String date = request.getParameter("date");
        java.sql.Date sqlDate = parseDate(date);
        return busDao.findFreeToday(sqlDate, shift);
    }

}
