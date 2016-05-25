package servlets.entity;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

@WebServlet
public abstract class SearchingPrint extends PrintController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try{
            print(search(request), response);
        }
        catch (Exception exception){
            response.setStatus(500);
            print(handle(exception), response);
        }
    }

    protected abstract ArrayList search(HttpServletRequest request) throws ParseException, IOException, SQLException, NumberFormatException, NamingException, NullPointerException;
}
