package service;

import entities.Bus;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PersonnelRegexMatches {

    public static boolean regNumberMatches(String regNumber){
        Pattern patternRegNumber = Pattern.compile("^[A-Za-z0-9-]{5,10}$");
        Matcher matcherRegNumber = patternRegNumber.matcher(regNumber);
        return matcherRegNumber.matches();
    }

    public static boolean markMatches(String mark){
        Pattern patternMark = Pattern.compile("^[A-Za-zА-Яа-яЁё0-9 -]{1,30}$");
        Matcher matcherMark = patternMark.matcher(mark);
        return matcherMark.matches();
    }

    public static boolean modelMatches(String model){
        Pattern patternModel = Pattern.compile("^[A-Za-zА-Яа-яЁё0-9 -]{1,20}$");
        Matcher matcherModel = patternModel.matcher(model);
        return matcherModel.matches();
    }

    public static boolean descriptionMatches(String description){
        Pattern patternDescription = Pattern.compile("^[A-Za-zА-Яа-яЁё0-9-(),. ]{0,64}$");
        Matcher matcherDescription = patternDescription.matcher(description);
        return matcherDescription.matches();
    }

    public static boolean busMatches(String regNumber, String mark, String model, String description){
        return  (regNumberMatches(regNumber) & markMatches(mark) & modelMatches(model) & descriptionMatches(description));
    }

    public static Bus getBus(HttpServletRequest request){
        Integer number = new Integer(request.getParameter("number"));
        String mark = request.getParameter("mark");
        String model = request.getParameter("model");
        String regNumber = request.getParameter("regNumber");
        boolean state = Boolean.valueOf(request.getParameter("state"));
        String description = request.getParameter("description");
        if (PersonnelRegexMatches.busMatches(regNumber, mark, model, description)) {
            if (number != null){
                return new Bus(number, regNumber, mark, model, state, description);
            }
            else{
                return new Bus(regNumber, mark, model, state, description);
            }
        }
        return null;
    }
}
