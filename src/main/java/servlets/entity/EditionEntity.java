package servlets.entity;

import javax.ejb.EJBException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

@WebServlet
public abstract class EditionEntity extends PrintController{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            select(request);
        } catch (Exception exception) {
            request.getSession().setAttribute("error", handle(exception));
        }
        request.getRequestDispatcher("WEB-INF/pages/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try{
            edit(request);
            response.sendRedirect("profile?number="+request.getParameter("number"));
        }
        catch (Exception exception){
            request.getSession().setAttribute("error", handle(exception));
            request.getRequestDispatcher("WEB-INF/pages/edit.jsp").forward(request, response);
        }
    }

    protected abstract void select(HttpServletRequest request) throws IOException, SQLException, NumberFormatException, NamingException, NullPointerException;

    protected abstract void edit(HttpServletRequest request) throws SQLException, NumberFormatException, ParseException, NullPointerException, EJBException;
}
