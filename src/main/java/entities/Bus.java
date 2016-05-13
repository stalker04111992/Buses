package entities;

import javax.persistence.*;
import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Entity(name = "bus")
@Table(name = "bus")
public class Bus{
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "regNumber", unique = true, length = 10, nullable = false)
    private String regNumber;

    @Column(name = "mark", nullable = false, length = 30)
    private String mark;

    @Column(name = "model", nullable = false, length = 20)
    private String model;

    @Column(name = "state", nullable = false)
    private boolean state;

    @Column(name = "category", length = 2, nullable = false)
    private String category;

    @Column(name = "description", length = 64, nullable = false)
    private String description;

    public Bus(){}

    public static Bus createBus(HttpServletRequest request) throws NullPointerException, NumberFormatException{
        String index = request.getParameter("number");
        String mark = request.getParameter("mark");
        String model = request.getParameter("model");
        String regNumber = request.getParameter("regNumber");
        boolean state = Boolean.valueOf(request.getParameter("state"));
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        if (busMatches(regNumber, mark, model)){
            Bus bus = new Bus(regNumber, mark, model, state, category, description);
            if(index != null){
                bus.setId(new Integer(index));
            }
            return bus;
        }
        throw new NumberFormatException();
    }

    public Bus(String regNumber, String mark, String model, boolean state, String category, String description){
        this.setRegNumber(regNumber);
        this.setMark(mark);
        this.setModel(model);
        this.setState(state);
        this.setCategory(category);
        this.setDescription(description);
    }

    @Override
    public int hashCode(){
        return this.id;
    }

    @Override
    public boolean equals(Object object){
        if (object instanceof Bus){
            Bus bus = (Bus) object;
            return bus.getId() == this.id & bus.getRegNumber().equals(this.regNumber)
                    & bus.getMark().equals(this.mark) & bus.getModel().equals(this.model)
                    & bus.getCategory() == this.category;
        }
        return false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRegNumber() {
        return regNumber;
    }

    public void setRegNumber(String regNumber) {
        this.regNumber = regNumber;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public static boolean regNumberMatches(String regNumber){
        Pattern patternRegNumber = Pattern.compile("^[A-Z]{2} [0-9]{4}-[0-9]{1}$");
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

    public static boolean busMatches(String regNumber, String mark, String model){
        return  (regNumberMatches(regNumber) & markMatches(mark) & modelMatches(model));
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
