package servlets.table;

import service.GraphicDao;
import servlets.entity.DeletingPrint;

import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@WebServlet(value = "/management/table/delete")
public class DeletionPrint extends DeletingPrint {

    @EJB
    GraphicDao graphicDao;

    protected String delete(HttpServletRequest request)throws SQLException, NumberFormatException, NullPointerException{
        int graph = new Integer(request.getParameter("graph"));
        return graphicDao.setBusNull(graph) > 0 ? "Автобус удален из графика" : "Автобус не удален из графика";
    }
}
