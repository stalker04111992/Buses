package servlets.entity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet
public abstract class DeletionEntity extends PrintController{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        try{
            delete(request);
            response.sendRedirect("view");
        }
        catch (Exception exception){
            request.getSession().setAttribute("error", handle(exception));
            request.getRequestDispatcher("WEB-INF/pages/profile.jsp").forward(request, response);
        }
    }
    protected abstract void delete(HttpServletRequest request)throws SQLException, NumberFormatException, NullPointerException;
}
