package servlets.graph;

import service.GraphicDao;
import servlets.entity.DeletingPrint;

import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@WebServlet(value = "/management/graph/deletegraph")
public class DeletionPrint extends DeletingPrint {

    @EJB
    GraphicDao graphicDao;

    protected String delete(HttpServletRequest request)throws SQLException, NumberFormatException, NullPointerException{
        int number = new Integer(request.getParameter("id"));
        return graphicDao.deleteGraph(number) > 0 ? "Рабочий день удален" : "Рабочий день не удален";
    }
}
