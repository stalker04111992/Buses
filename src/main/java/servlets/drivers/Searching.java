package servlets.drivers;

import servlets.entity.SearchingPrintingDriver;
import javax.servlet.annotation.WebServlet;

@WebServlet(value = "/management/drivers/search")
public class Searching extends SearchingPrintingDriver {
}
