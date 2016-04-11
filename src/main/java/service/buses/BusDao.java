package service.buses;

import entities.Bus;
import javax.ejb.*;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.sql.*;
import java.util.ArrayList;

@Stateless
public class BusDao {

    @PersistenceContext(unitName = "Depot")
    private EntityManager em;

    public void saveBus(Bus bus)throws SQLException {
        Query query = em.createNativeQuery("{call saveBus(?,?,?,?,?)}",
                Bus.class)
                .setParameter(1, bus.getRegNumber())
                .setParameter(2, bus.getMark())
                .setParameter(3, bus.getModel())
                .setParameter(4, bus.isState())
                .setParameter(5, bus.getDescription());
        int result = query.executeUpdate();
        if (result == 0){
            throw new SQLException();
        }
    }

    public ArrayList<Bus> findByMark (String mark) throws SQLException, NamingException {
        Query query = em.createNativeQuery("{call findByMark(?)}",
                Bus.class)
                .setParameter(1, mark);
        return new ArrayList<Bus>(query.getResultList());
    }

    public ArrayList<Bus> findByNumber (int number) throws SQLException, NamingException{
        Query query = em.createNativeQuery("{call findByNumber(?)}",
                Bus.class)
                .setParameter(1, number);
        return new ArrayList<Bus>(query.getResultList());
    }

    public ArrayList<Bus> findByRegNumber (String regNumber) throws SQLException, NamingException{
        Query query = em.createNativeQuery("{call findByRegNumber(?)}",
                Bus.class)
                .setParameter(1, regNumber);
        return new ArrayList<Bus>(query.getResultList());
    }

    public ArrayList<Bus> findByModel (String model) throws SQLException, NamingException{
        Query query = em.createNativeQuery("{call findByRegNumber(?)}",
                Bus.class)
                .setParameter(1, model);
        return new ArrayList<Bus>(query.getResultList());
    }

    public ArrayList<Bus> findAll()throws SQLException, NamingException {
        Query query = em.createNativeQuery("{call getAllBuses()}", Bus.class);
        return new ArrayList<Bus>(query.getResultList());
    }

    public ArrayList<Integer> getNumbers(){
        Query query = em.createNativeQuery("{call getAllNumbers()}");
        return new ArrayList<Integer>(query.getResultList());
    }

    public void updateBus(Bus bus)throws SQLException{
        Query query = em.createNativeQuery("{call updateBus(?,?,?,?,?,?)}",
                Bus.class)
                .setParameter(1, bus.getId())
                .setParameter(2, bus.getRegNumber())
                .setParameter(3, bus.getMark())
                .setParameter(4, bus.getModel())
                .setParameter(5, bus.isState())
                .setParameter(6, bus.getDescription());
        int result = query.executeUpdate();
        if (result == 0){
            throw new SQLException();
        }
    }

    public void delete(int index)throws SQLException{
        Query query = em.createNativeQuery("{call deleteBus(?)}",
                Bus.class)
                .setParameter(1, index);
        int result = query.executeUpdate();
        if (result == 0){
            throw new SQLException();
        }
    }
}
