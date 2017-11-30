package Controller;

import java.io.IOException;
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

import DataAccess.AdminDA;
import DataAccess.ClientDA;
import DataAccess.StaffDA;
import Model.Admin;
import Model.Client;
import Model.ClientIllness;
import Model.Staff;

@WebServlet(urlPatterns = {"/login"}, name="login")
public class login extends HttpServlet{

	public static final long serialVersionUID = 1L;



	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd = null;
		Staff st = new Staff();
		Admin a = new Admin();

		AdminDA ada = new AdminDA();
		StaffDA sDa = new StaffDA();



		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		st.setStaffID(username);
		st.setStaffPassword(password);
		a.setAdminID(username);
		a.setAdminPassword(password);

		System.out.println(a.getAdminID());
		//System.out.println(password);

		ada.adminLogin(a);
		sDa.staffLogin(st);
		HttpSession session = request.getSession(true);
		if(a.isValid()){
			
			
			session.setAttribute("username", a.getAdminID());
			//session.setAttribute("password", a.getAdminPassword());
			System.out.println("ada ke x");
			response.sendRedirect("manageStaff");
		}else if(st.isValid()){
			
			
			session.setAttribute("username", st.getStaffID());
			session.setAttribute("staff", st.getStaffName());
			//session.setAttribute("password", a.getAdminPassword());
			System.out.println("ada ke x");
			response.sendRedirect("submitPreference");
		}else{
			response.sendRedirect("");
		}




		//rd = request.getRequestDispatcher("/manageStaff");
		//rd.forward(request, response);


	}

}

