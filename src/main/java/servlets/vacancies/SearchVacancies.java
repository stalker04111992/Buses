package servlets.vacancies;

import entities.Vacancy;
import service.vacancies.VacancyDao;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/management/vacancies/searchvacancies")
public class SearchVacancies extends HttpServlet {

    @EJB
    VacancyDao vacancyDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        search(request);
        request.getRequestDispatcher("WEB-INF/pages/viewvacancies.jsp").forward(request, response);
    }

    private void search(HttpServletRequest request){
        try{
            int param = new Integer(request.getParameter("search"));
            String line = request.getParameter("line");
            ArrayList<Vacancy> vacancies = null;
            switch (param){
                case 0:{
                    int number = new Integer(line);
                    vacancies = vacancyDao.findByNumber(number);
                    break;
                }
                case 1:{
                    int count = new Integer(line);
                    vacancies = vacancyDao.findByCount(count);
                    break;
                }
                case 2:{
                    vacancies = vacancyDao.findAll();
                    break;
                }
            }
            request.setAttribute("vacancies", vacancies);
            request.setAttribute("search", param);
        }
        catch (NullPointerException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка в параметрах");
        }
        catch (SQLException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка подключения к базе данных");
        }
        catch (NamingException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Неверный формат данных");
        }
        catch (NumberFormatException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Неверный формат данных");
        }
    }
}
