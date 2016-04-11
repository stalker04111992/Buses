package servlets.vacancies;

import entities.Vacancy;
import service.vacancies.VacancyDao;
import service.vacancies.VacancyRegexMatches;
import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/management/buses/updatebus")
public class UpdateVacancy extends HttpServlet {
    @EJB
    VacancyDao vacancyDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try{
            int number = new Integer(request.getParameter("selected"));
            Vacancy vacancy = vacancyDao.findByNumber(number).get(0);
            request.setAttribute("selectedVacancy", vacancy);
            request.getRequestDispatcher("WEB-INF/pages/editvacancy.jsp").forward(request, response);
        }
        catch (SQLException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка подключения к базе данных");
            request.getRequestDispatcher("WEB-INF/pages/editvacancy.jsp").forward(request, response);
        }
        catch (NamingException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка запроса к базе данных");
            request.getRequestDispatcher("WEB-INF/pages/editvacancy.jsp").forward(request, response);
        }
        catch (NullPointerException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка. Данные не найдены");
            request.getRequestDispatcher("WEB-INF/pages/editvacancy.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try{
            Vacancy vacancy = VacancyRegexMatches.getVacancy(request);
            vacancyDao.updateVacancy(vacancy);
            response.sendRedirect("../../management");
        }
        catch (NullPointerException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Ошибка. Нет параметров");
            request.getRequestDispatcher("WEB-INF/pages/editvacancy.jsp").forward(request, response);
        }
        catch(SQLException exception){
            exception.printStackTrace();
            request.setAttribute("error", "Произошла ошибка при работе с базой данных");
            request.getRequestDispatcher("WEB-INF/pages/editvacancy.jsp").forward(request, response);
        }
    }
}
