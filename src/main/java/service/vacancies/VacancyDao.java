package service.vacancies;

import entities.Vacancy;
import javax.ejb.Stateless;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.sql.SQLException;
import java.util.ArrayList;

@Stateless
public class VacancyDao {

    @PersistenceContext(unitName = "Depot")
    private EntityManager em;

    public void saveVacancy(Vacancy vacancy)throws SQLException {
        Query query = em.createNativeQuery("{call saveVacancy(?,?,?,?)}",
                Vacancy.class)
                .setParameter(1, vacancy.getTitle())
                .setParameter(2, vacancy.getSalary())
                .setParameter(3, vacancy.getCount())
                .setParameter(4, vacancy.getDescription());
        int result = query.executeUpdate();
        if (result == 0){
            throw new SQLException();
        }
    }

    public ArrayList<Vacancy> findByNumber (int number) throws SQLException, NamingException{
        Query query = em.createNativeQuery("{call findVacancyByNumber(?)}",
                Vacancy.class)
                .setParameter(1, number);
        return new ArrayList<Vacancy>(query.getResultList());
    }

    public ArrayList<Vacancy> findByCount (int count) throws SQLException, NamingException{
        Query query = em.createNativeQuery("{call findVacancyByCount(?)}",
                Vacancy.class)
                .setParameter(1, count);
        return new ArrayList<Vacancy>(query.getResultList());
    }

    public ArrayList<Vacancy> findAll()throws SQLException, NamingException {
        Query query = em.createNativeQuery("{call getAllVacancies()}", Vacancy.class);
        return new ArrayList<Vacancy>(query.getResultList());
    }

    public void updateVacancy(Vacancy vacancy)throws SQLException{
        Query query = em.createNativeQuery("{call updateVacancy(?,?,?,?,?)}",
                Vacancy.class)
                .setParameter(1, vacancy.getId())
                .setParameter(2, vacancy.getTitle())
                .setParameter(3, vacancy.getSalary())
                .setParameter(4, vacancy.getCount())
                .setParameter(5, vacancy.getDescription());
        int result = query.executeUpdate();
        if (result == 0){
            throw new SQLException();
        }
    }

    public void delete(int index)throws SQLException{
        Query query = em.createNativeQuery("{call deleteVacancy(?)}",
                Vacancy.class)
                .setParameter(1, index);
        int result = query.executeUpdate();
        if (result == 0){
            throw new SQLException();
        }
    }
}
