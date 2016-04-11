package entities;

import javax.persistence.*;

@Entity(name = "bus")
@Table(name = "bus")
public class Bus {
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

    @Column(name = "description", length = 64, nullable = false)
    private String description;

    public Bus(){}

    public Bus(int id, String regNumber, String mark, String model, boolean state, String description){
        this.setId(id);
        this.setRegNumber(regNumber);
        this.setMark(mark);
        this.setModel(model);
        this.setState(state);
        this.setDescription(description);
    }

    public Bus(String regNumber, String mark, String model, boolean state, String description){
        this.setRegNumber(regNumber);
        this.setMark(mark);
        this.setModel(model);
        this.setState(state);
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
                    & bus.isState() == this.state;
        }
        else{
            return false;
        }
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
}
