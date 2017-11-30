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
import javax.websocket.Session;

import DataAccess.ClientDA;
import DataAccess.StaffDA;
import Model.Client;
import Model.ClientIllness;
import Model.Staff;

@WebServlet(urlPatterns = {"/createStaff"}, name="createStaff")
public class createStaffHandler extends HttpServlet{

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
		HttpSession sess = request.getSession(false);
		System.out.println(request.getParameter("username"));

		st.setStaffID(request.getParameter("username"));
		st.setStaffName(request.getParameter("name"));
		st.setStaffEmail(request.getParameter("email"));
		st.setStaffAddress(request.getParameter("address"));
		st.setStaffPassword(request.getParameter("password"));
		st.setStaffPhoneNo(request.getParameter("phone"));
		String adminID = (String)sess.getAttribute("username");
		//String adminID = "3001";
		
		System.out.println("createStaff"+adminID);

		StaffDA sda = new StaffDA();
		
		System.out.println(st.getStaffID());
		sda.registerStaff(st, adminID);


		rd = request.getRequestDispatcher("/manageStaff");
		rd.forward(request, response);
		

	}

}

