package entities;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Entity(name="driver")
@Table(name="driver")
public class Driver {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;
    //персональные данные
    @Column(name = "lastName", length = 50, nullable = false)
    private String lastName;
    @Column(name = "firstName", length = 50, nullable = false)
    private String firstName;
    @Column(name = "licenseNumber", unique = true, length = 10, nullable = false)
    private String licenseNumber;
    @Column(name = "driverClass", nullable = false)
    private int driverClass;

    public Driver(){}

    public static Driver getDriver(HttpServletRequest request) throws NumberFormatException, NullPointerException{
        String number = request.getParameter("number");
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String licenseNumber = request.getParameter("licenseNumber");
        String driverClass = request.getParameter("driverClass");
        if (personnelMatches(lastName, firstName, licenseNumber)) {
            Driver driver = new Driver(lastName, firstName, licenseNumber, new Integer(driverClass));
            if(number != null){
               driver.setId(new Integer(number));
            }
            return driver;
        }
        return null;
    }

    public Driver(String lastName, String firstName, String licenseNumber, int driverClass){
        this.setLastName(lastName);
        this.setFirstName(firstName);
        this.setLicenseNumber(licenseNumber);
        this.setDriverClass(driverClass);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public static boolean nameMatches(String lastName){
        Pattern patternLastName = Pattern.compile("^[A-Za-zА-Яа-яЁё -]{1,50}$");
        Matcher matcherLastName = patternLastName.matcher(lastName);
        return matcherLastName.matches();
    }

    public static boolean licenseMatches(String lastName){
        Pattern patternLicense = Pattern.compile("^[0-9]{1}[A-Z]{2} [0-9]{6}$");
        Matcher matcherLicense = patternLicense.matcher(lastName);
        return matcherLicense.matches();
    }
/*
    public static boolean birthDateMatches(String birthDate){
        Pattern patternBirthDate= Pattern.compile("^[0-9]{4}-[0-9]{2}-[0-9]{2}$");
        Matcher matcherBirthDate = patternBirthDate.matcher(birthDate);
        return matcherBirthDate.matches();
    }

    public static boolean addressMatches(String address){
        Pattern patternAddress = Pattern.compile("^[A-Za-zА-Яа-яЁё0-9-(),. ]{0,256}$");
        Matcher matcherAddress = patternAddress.matcher(address);
        return matcherAddress.matches();
    }

    public static boolean telephoneMatches(String telephone){
        Pattern patternTelephone = Pattern.compile("^[0-9]{0,15}$");
        Matcher matcherTelephone = patternTelephone.matcher(telephone);
        return matcherTelephone.matches();
    }
*/
    public static boolean personnelMatches(String lastName, String firstName, String licenseNumber){
        return  (nameMatches(lastName) & nameMatches(firstName) & licenseMatches(licenseNumber));
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public int getDriverClass() {
        return driverClass;
    }

    public void setDriverClass(int driverClass) {
        this.driverClass = driverClass;
    }
}
