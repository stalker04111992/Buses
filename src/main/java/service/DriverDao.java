package service;

import entities.Driver;
import javax.ejb.Stateless;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

@Stateless
public class DriverDao {

    @PersistenceContext(unitName = "Depot")
    private EntityManager em;

    public int saveDriver(Driver driver)throws SQLException {
        Query query = em.createNativeQuery("{call saveDriver(?,?,?,?)}",
                Driver.class)
                .setParameter(1, driver.getLastName())
                .setParameter(2, driver.getFirstName())
                .setParameter(3, driver.getDriverClass())
                .setParameter(4, driver.getLicenseNumber())
                ;
        return query.executeUpdate();
    }

    public int updateDriver(Driver driver)throws SQLException {
        Query query = em.createNativeQuery("{call updateDriver(?,?,?,?,?)}",
                Driver.class)
                .setParameter(1, driver.getId())
                .setParameter(2, driver.getLastName())
                .setParameter(3, driver.getFirstName())
                .setParameter(4, driver.getDriverClass())
                .setParameter(5, driver.getLicenseNumber())
                ;

        return query.executeUpdate();
    }

    public ArrayList<Driver> findAll()throws SQLException, NamingException {
        Query query = em.createNativeQuery("{call getAllDrivers()}", Driver.class);
        return new ArrayList<Driver>(query.getResultList());
    }

    public ArrayList<Driver> findToday(Date date, int shift)throws SQLException, NamingException {
        Query query = em.createNativeQuery("{call findToday(?,?)}", Driver.class)
                .setParameter(1, date)
                .setParameter(2, shift)
                ;
        return new ArrayList<Driver>(query.getResultList());
    }

    public ArrayList<Driver> findByNumber (int number) throws SQLException, NamingException {
        Query query = em.createNativeQuery("{call findById(?)}",
                Driver.class)
                .setParameter(1, number);
        return new ArrayList<Driver>(query.getResultList());
    }

    public ArrayList<Driver> findByLastName (String lastName) throws SQLException, NamingException {
        Query query = em.createNativeQuery("{call findByLastName(?)}",
                Driver.class)
                .setParameter(1, lastName);
        return new ArrayList<Driver>(query.getResultList());
    }

    public int delete(int index)throws SQLException{
        Query query = em.createNativeQuery("{call deleteDriver(?)}",
                Driver.class)
                .setParameter(1, index);
        return query.executeUpdate();
    }

}
