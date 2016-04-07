package servlets;

import service.UserDao;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(value = {"/index", "/admin", "/graphic", "/management"})
public class Controller extends HttpServlet{

    @EJB
    UserDao userDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException{
        //set html header
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        //get request url
        String uri = request.getServletPath();
        ResultSet resultSet = userDao.findResultSetByUsername("12");
        //forward
        request.getRequestDispatcher("WEB-INF/pages" + uri + ".jsp").forward(request, response);
    }
}
