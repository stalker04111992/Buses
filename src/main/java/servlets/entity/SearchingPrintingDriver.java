package servlets.entity;

import entities.Driver;
import org.apache.commons.lang.math.NumberUtils;
import service.DriverDao;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class SearchingPrintingDriver extends SearchingPrint {
    @EJB
    DriverDao driverDao;

    protected ArrayList<Driver> search(HttpServletRequest request) throws SQLException, NumberFormatException, NamingException{
        String param = request.getParameter("param");
        if(NumberUtils.isNumber(param)){
            return driverDao.findByNumber(new Integer(param));
        }
        if (param.length() != 0){
            return driverDao.findByLastName(param);
        }
        return driverDao.findAll();
    }
}
