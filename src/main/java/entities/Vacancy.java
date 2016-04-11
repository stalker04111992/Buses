package entities;

import javax.persistence.*;

@Entity(name = "vacancy")
@Table(name = "vacancy")
public class Vacancy {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "title", unique = true, length = 50, nullable = false)
    private String title;

    @Column(name = "salary", nullable = false)
    private float salary;

    @Column(name = "count", nullable = false)
    private int count;

    @Column(name = "description", nullable = false, length = 256)
    private String description;

    public Vacancy(){}

    public Vacancy(int id, String title, float salary, int count, String description){
        this.setId(id);
        this.setTitle(title);
        this.setSalary(salary);
        this.setCount(count);
        this.setDescription(description);
    }

    public Vacancy(String title, float salary, int count, String description){
        this.setTitle(title);
        this.setSalary(salary);
        this.setCount(count);
        this.setDescription(description);
    }

    @Override
    public int hashCode(){
        return this.id;
    }

    @Override
    public boolean equals(Object object){
        if (object instanceof Vacancy){
            Vacancy vacancy = (Vacancy) object;
            return vacancy.getId() == this.id & vacancy.getTitle().equals(this.title)
                    & vacancy.getSalary() == this.salary & vacancy.getCount() == this.count;
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


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
