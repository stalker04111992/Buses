package servlets.entity;

import entities.Bus;
import org.apache.commons.lang.math.NumberUtils;
import service.BusDao;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class SearchingPrintingBuses extends SearchingPrint {
    @EJB
    BusDao busDao;

    protected ArrayList<Bus> search(HttpServletRequest request) throws SQLException, NumberFormatException, NamingException{
        String param = request.getParameter("param");
        if(NumberUtils.isNumber(param)){
            return busDao.findByNumber(new Integer(param));
        }
        if (param.length() != 0){
            return busDao.findByRegNumber(param);
        }
        return busDao.findAll();
    }
}
