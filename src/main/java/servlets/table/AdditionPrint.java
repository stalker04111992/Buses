package servlets.table;

import service.GraphicDao;
import servlets.entity.SavingPrint;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.text.ParseException;

@WebServlet(value = "/management/table/add")
public class AdditionPrint extends SavingPrint {

    @EJB
    GraphicDao graphicDao;

    protected String add(HttpServletRequest request)throws ParseException, NumberFormatException, SQLException, EJBException, NullPointerException{
        int bus = new Integer(request.getParameter("bus"));
        int graph = new Integer(request.getParameter("graph"));
        return (graphicDao.setBus(graph, bus) > 0) ? "Автобус назначен" : "Автобус не назначен";
    }
}
