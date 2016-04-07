package entities;

import javax.persistence.*;
import java.sql.Date;

@Entity(name="personnel")
@Table(name="personnel")
public class Personnel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;
    //персональные данные
    @Column(name = "lastName", length = 50, nullable = false)
    private String lastName;
    @Column(name = "firstName", length = 50, nullable = false)
    private String firstName;
    @Column(name = "patronymic", length = 50, nullable = false)
    private String patronymic;
    @Column(name = "birthDate", nullable = false)
    private Date birthDate;
    @Column(name = "address", length = 512, nullable = false)
    private String address;
    @Column(name = "telephone", length = 20, nullable = true)
    private String telephone;
    @Column(name = "email", length = 50, nullable = true)
    private String email;
    @Column(name = "enabled", nullable = false)
    private boolean enabled;

    public Personnel(){}

    public Personnel(String lastName, String firstName, String patronymic, Date birthDate, String address,
                     String telephone, String email, boolean enabled){

        this.setLastName(lastName);
        this.setFirstName(firstName);
        this.setPatronymic(patronymic);
        this.setBirthDate(birthDate);
        this.setAddress(address);
        this.setTelephone(telephone);
        this.setEmail(email);
        this.setEnabled(enabled);
    }
/*
    @OneToMany(mappedBy="personnel", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    private Set<Role> roles;
*/
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
