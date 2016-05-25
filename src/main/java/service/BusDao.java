package service;

import entities.*;

import javax.ejb.*;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

@Stateless
public class BusDao{

    @PersistenceContext(unitName = "Depot")
    private EntityManager em;

    public int getCountsBuses(int number, String regNumber)throws NumberFormatException{
        Query query = em.createNativeQuery("{call getCountsBuses(?,?) }")
                .setParameter(1, number)
                .setParameter(2, regNumber)
                ;
        return (Integer)query.getResultList().get(0);
    }

    public int saveBus(Bus bus)throws SQLException {
        Query query = em.createNativeQuery("{call saveBus(?,?,?,?,?,?)}",
                Bus.class)
                .setParameter(1, bus.getRegNumber())
                .setParameter(2, bus.getMark())
                .setParameter(3, bus.getModel())
                .setParameter(4, bus.isState())
                .setParameter(5, bus.getCategory())
                .setParameter(6, bus.getDescription());
        return query.executeUpdate();
    }

    public ArrayList<Bus> findByRegNumber (String number) throws SQLException, NamingException{
        Query query = em.createNativeQuery("{call findByRegNumber(?)}",
                Bus.class)
                .setParameter(1, number);
        return new ArrayList<Bus>(query.getResultList());
    }

    public ArrayList<Bus> findByNumber (int number) throws SQLException, NamingException{
        Query query = em.createNativeQuery("{call findByNumber(?)}",
                Bus.class)
                .setParameter(1, number);
        return new ArrayList<Bus>(query.getResultList());
    }

    public ArrayList<Bus> findFreeToday(Date date, int shift)throws SQLException, NamingException {
        Query query = em.createNativeQuery("{call findFreeToday(?,?)}", Bus.class)
                .setParameter(1, date)
                .setParameter(2, shift)
                ;
        return new ArrayList<Bus>(query.getResultList());
    }

    public ArrayList<Bus> findAll()throws SQLException, NamingException {
        Query query = em.createNativeQuery("{call getAllBuses()}", Bus.class);
        return new ArrayList<Bus>(query.getResultList());
    }

    public int updateBus(Bus bus)throws SQLException{
        Query query = em.createNativeQuery("{call updateBus(?,?,?,?,?,?,?)}",
                Bus.class)
                .setParameter(1, bus.getId())
                .setParameter(2, bus.getRegNumber())
                .setParameter(3, bus.getMark())
                .setParameter(4, bus.getModel())
                .setParameter(5, bus.isState())
                .setParameter(6, bus.getCategory())
                .setParameter(7, bus.getDescription());
        return query.executeUpdate();
    }

    public int delete(int index)throws SQLException{
        Query query = em.createNativeQuery("{call deleteBus(?)}",
                Bus.class)
                .setParameter(1, index);
        return query.executeUpdate();
    }
}
