package service.vacancies;

import entities.Vacancy;
import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class VacancyRegexMatches {

    public static boolean titleMatches(String title){
        Pattern patternTitle = Pattern.compile("^[A-Za-zА-Яа-яЁё0-9-(), ]{1,50}$");
        Matcher matcherTitle = patternTitle.matcher(title);
        return matcherTitle.matches();
    }

    public static boolean salaryMatches(String salary){
        Pattern patternSalary= Pattern.compile("^[0-9.]{1,12}$");
        Matcher matcherSalary = patternSalary.matcher(salary);
        return matcherSalary.matches();
    }

    public static boolean countMatches(String count){
        Pattern patternCount= Pattern.compile("^[0-9]{1,3}$");
        Matcher matcherCount = patternCount.matcher(count);
        return matcherCount.matches();
    }

    public static boolean descriptionMatches(String description){
        Pattern patternDescription = Pattern.compile("^[A-Za-zА-Яа-яЁё0-9-(),. ]{0,256}$");
        Matcher matcherDescription = patternDescription.matcher(description);
        return matcherDescription.matches();
    }

    public static boolean vacancyMatches(String title, String salary, String count, String description){
        return  (titleMatches(title) & salaryMatches(salary) & countMatches(count) & descriptionMatches(description));
    }

    public static Vacancy getVacancy(HttpServletRequest request){
        try{
            String number = request.getParameter("number");
            String title = request.getParameter("title");
            String salary = request.getParameter("salary");
            String count = request.getParameter("count");
            String description = request.getParameter("description");
            float salaryFloat = new Float(salary);
            int countInt = new Integer(count);
            if (vacancyMatches(title, salary, count, description)){
                if (number == null){
                    return new Vacancy(title, salaryFloat, countInt, description);
                }
                else{
                    int id = new Integer(number);
                    return new Vacancy(id, title, salaryFloat, countInt, description);
                }
            }
            else{
                return null;
            }
        }
        catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
    }
}
