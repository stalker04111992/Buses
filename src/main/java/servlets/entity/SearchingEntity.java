package servlets.entity;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet
public abstract class SearchingEntity extends PrintController{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            search(request);
        } catch (Exception exception) {
            request.getSession().setAttribute("error", handle(exception));
        }
        request.getRequestDispatcher("WEB-INF/pages/view.jsp").forward(request, response);
    }

    protected abstract void search(HttpServletRequest request) throws IOException, SQLException, NumberFormatException, NamingException, NullPointerException;
}
