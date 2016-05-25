package servlets.graph;

import service.GraphicDao;
import servlets.entity.SavingPrint;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(value = "/management/graph/add")
public class AdditionPrint extends SavingPrint {

    @EJB
    GraphicDao graphicDao;

    protected String add(HttpServletRequest request)throws ParseException, NumberFormatException, SQLException, EJBException, NullPointerException{
        int driverId = new Integer(request.getParameter("number"));
        String date = request.getParameter("date");
        int shift = new Integer(request.getParameter("shift"));
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date parsed = format.parse(date);
        java.sql.Date sqlDate = new java.sql.Date(parsed.getTime());
        return (graphicDao.addShift(driverId, sqlDate, shift) > 0) ? "Смена добавлена" : "Смена не добавлена";
    }
}
