package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = {"/management/buses/add", "/management/buses/edit", "/management/buses/view", "/management/buses/search", "/management/buses/delete", "/management/buses/profile"})
public class Vacancies extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String uri = request.getServletPath();
        uri = uri.replace("/management/buses/", "");
        if(uri.equals("search")){
            uri = "view";
        }
        request.getRequestDispatcher("WEB-INF/pages/" + uri + ".jsp").forward(request, response);
    }
}
