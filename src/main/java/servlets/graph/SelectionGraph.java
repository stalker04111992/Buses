package servlets.graph;

import entities.Driver;
import entities.Graph;
import service.DriverDao;
import service.GraphicDao;
import servlets.entity.UnionSelect;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/management/graph/select")
public class SelectionGraph extends UnionSelect {

    @EJB
    DriverDao driverDao;
    @EJB
    GraphicDao graphicDao;

    protected void select(HttpServletRequest request) throws IOException, IndexOutOfBoundsException, NamingException, SQLException, NullPointerException, EJBException {
        int number = new Integer(request.getParameter("number"));
        ArrayList<Driver> driver = driverDao.findByNumber(number);
        request.setAttribute("driver", print(driver));
        ArrayList<Graph> graphs = graphicDao.selectMonth(number);
        request.setAttribute("graphs", print(graphs));
    }
}
