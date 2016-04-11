package servlets.personnels;

import entities.Vacancy;
import service.vacancies.VacancyDao;
import service.vacancies.VacancyRegexMatches;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/management/personnels/addpersonnel")
public class AddPersonnel extends HttpServlet{
    @EJB
    VacancyDao vacancyDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("WEB-INF/pages/addpersonnel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        try{
            Vacancy vacancy = VacancyRegexMatches.getVacancy(request);
            vacancyDao.saveVacancy(vacancy);
            response.sendRedirect("addvacancy");
        }
        catch (SQLException exception){
            request.setAttribute("error", "Произошла ошибка при работе с базой данных");
            request.getRequestDispatcher("WEB-INF/pages/addvacancy.jsp").forward(request, response);
        }
        catch (NullPointerException exception){
            request.setAttribute("error", "Ошибка формата вводимых данных");
            request.getRequestDispatcher("WEB-INF/pages/addvacancy.jsp").forward(request, response);
        }
    }
}
