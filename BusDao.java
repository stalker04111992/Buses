package service;

import entities.Bus;
import entities.User;

import javax.annotation.Resource;
import javax.ejb.*;
import javax.enterprise.context.SessionScoped;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
import javax.transaction.*;
import java.sql.*;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Stateless
public class BusDao
{
    @PersistenceContext(unitName = "Depot")
    private EntityManager em;

    public void save(Bus bus)
    {
        try{
            em.persist(bus);
        }
        catch (Exception exception){
            exception.printStackTrace();
        }
    }

    public void saveBus(Bus bus)throws SQLException, NamingException{
        //регулярные выражения
        Pattern patternRegNumber = Pattern.compile("^[A-Za-z0-9-]{5,10}$");
        Matcher matcherRegNumber = patternRegNumber.matcher(bus.getRegNumber());
        Pattern patternMark = Pattern.compile("^[A-Za-zА-Яа-яЁё0-9 -]{1,30}$");
        Matcher matcherMark = patternMark.matcher(bus.getMark());
        Pattern patternModel = Pattern.compile("^[A-Za-zА-Яа-яЁё0-9 -]{1,20}$");
        Matcher matcherModel = patternModel.matcher(bus.getMark());
        //проверка введенных данных
        if (matcherRegNumber.matches() & matcherMark.matches() & matcherModel.matches()) {
            PreparedStatement proc = connection().prepareStatement("{call saveBus(?,?,?,?,?)}");
            proc.setString(1, bus.getRegNumber());
            proc.setString(2, bus.getMark());
            proc.setString(3, bus.getModel());
            proc.setBoolean(4, bus.isState());
            proc.setString(5, bus.getDescription());
        }
        else{
            throw new IllegalStateException();
        }
    }

    public Bus findByRegNumber(String regNumber)
    {
        try{
            List buses = em.createQuery(
                    "SELECT b FROM bus b WHERE b.regNumber = :regNumber")
                    .setParameter("regNumber", regNumber)
                    .getResultList();
            return buses.size() > 0 ?  (Bus)buses.get(0) : null;
        }
        catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
    }

    private Connection connection() throws SQLException, NamingException{
        Context context = new InitialContext();
        DataSource dataSource = (DataSource)context.lookup("java:/jboss/datasources/BusDepot");
        return dataSource.getConnection();
    }

    public ResultSet findResultSetByMark(String mark)
    {
        try{
            /*Pattern pattern = Pattern.compile("^[A-Za-zА-Яа-яЁё0-9\\-\\ ]{1,30}$");
            Matcher matcher = pattern.matcher(mark);
            if (matcher.matches() == true){*/
                CallableStatement proc = connection().prepareCall("{call findByMark(?)}");
                proc.setString(1, mark);
                boolean res = proc.execute();
                if (!res){
                    throw new SQLException();
                }
                return proc.getResultSet();
            /*}
            else {
                return null;
            }*/
        }
        catch (Exception exception){
            return null;
        }
    }

    public ResultSet findResultSetByRegNumber(String regNumber)
    {
        try{
            Pattern pattern = Pattern.compile("^[a-zA-Z0-9-]{1,10}$");
            Matcher matcher = pattern.matcher(regNumber);
            if (matcher.matches() == true){
                ResultSet resultSet = connection().createStatement().executeQuery("SELECT b.id, b.mark, b.model, b.regNumber from bus b where b.regNumber = " + regNumber);
                return resultSet;
            }
            else {
                return null;
            }
        }
        catch (NamingException exception){
            return null;
        }
        catch (SQLException exception){
            return null;
        }
    }

    public ResultSet findAllMarks() {
        try{
            CallableStatement proc_clients = connection().prepareCall("{call getAllMarks}");
            boolean res = proc_clients.execute();
            if (!res){
                throw new SQLException();
            }
            return proc_clients.getResultSet();
        }
        catch (SQLException exception){
            return null;
        }
        catch (NamingException exception){
            return null;
        }
    }

    public ResultSet findAllResultSet() {
        try{
            return connection().createStatement().executeQuery("SELECT * from bus b");
        }
        catch (SQLException exception){
            return null;
        }
        catch (NamingException exception){
            return null;
        }
    }

    public List<Bus> findAll(){

        try{
            return em.createQuery("select b from bus b").getResultList();
        }
        catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
    }
}
