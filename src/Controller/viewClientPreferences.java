package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DataAccess.ClientDA;
import DataAccess.PackageDA;
import DataAccess.RulesDA;
import DataAccess.StaffDA;
import Model.Client;
import Model.ClientIllness;
import Model.Staff;

@WebServlet(urlPatterns = {"/viewClient"}, name="viewClient")
public class viewClientPreferences extends HttpServlet{

	public static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException{
		RequestDispatcher rd = null;

		HttpSession sess = request.getSession(false);
		String name= (String)sess.getAttribute("username");

		if(name!=null){
			System.out.println("test");

			request.setAttribute("client", ClientDA.getAllClient());



			rd = request.getRequestDispatcher("/viewClientPreferences.jsp");
		}else{
			System.out.println("invalid");
			rd = request.getRequestDispatcher("");
		}
		rd.forward(request, response);
	}




	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try{
			processRequest(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {




	}

}

