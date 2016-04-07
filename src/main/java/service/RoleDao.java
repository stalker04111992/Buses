package service;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@Stateless
@LocalBean
public class RoleDao {


    public ResultSet findResultSetById(int id)
    {
        try{
            Context context = new InitialContext();
            DataSource dataSource = (DataSource)context.lookup("java:/jboss/datasources/BusDepot");
            Connection connection = dataSource.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT role from roles r where r.userID = " + Integer.toString(id));
            return resultSet;
        }
        catch (NamingException exception){
            return null;
        }
        catch (SQLException exception){
            return null;
        }
    }

}
