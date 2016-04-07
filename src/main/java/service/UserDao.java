package service;

import entities.User;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Stateless
@LocalBean
public class UserDao
{
    @PersistenceContext(unitName = "Depot")
    private EntityManager em;

    public void save(User user)
    {
        em.persist(user);
    }

    public User findByUsername(String username)
    {
        List users = em.createQuery(
                "SELECT c FROM users c WHERE c.username = :username")
                .setParameter("username", username)
                .getResultList();
        return users.size() > 0 ?  (User)users.get(0) : null;
    }

    private Statement statement() throws SQLException, NamingException{
        Context context = new InitialContext();
        DataSource dataSource = (DataSource)context.lookup("java:/jboss/datasources/BusDepot");
        Connection connection = dataSource.getConnection();
        return connection.createStatement();
    }

    public ResultSet findResultSetByUsername(String username)
    {
        try{
            Pattern pattern = Pattern.compile("^[a-zA-Z0-9_]{1,50}$");
            Matcher matcher = pattern.matcher(username);
            if (matcher.matches() == true){
                ResultSet resultSet = statement().executeQuery("SELECT id, username, password, enabled from users u where u.username = " + username);
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

    public ResultSet findAllResultSet() {
        try{
            return statement().executeQuery("select u from users u");
        }
        catch (NamingException exception){
            return null;
        }
        catch (SQLException exception){
            return null;
        }
    }

    public List findAll() {
        return em.createQuery("select u from users u").getResultList();
    }
}
