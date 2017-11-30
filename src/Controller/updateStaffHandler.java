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
import DataAccess.StaffDA;
import Model.Client;
import Model.ClientIllness;
import Model.Staff;

@WebServlet(urlPatterns = {"/updateStaff"}, name="updateStaff")
public class updateStaffHandler extends HttpServlet{

	public static final long serialVersionUID = 1L;



	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try{
			processRequest(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException{
		RequestDispatcher rd = null;

		HttpSession sess = request.getSession(false);
		String username= (String)sess.getAttribute("username");
		String staff = (String)sess.getAttribute("staff");  
		if(username!=null){
			if(staff!=null){
				System.out.println("test");

				request.setAttribute("staff", StaffDA.getStaffByID(username));
				rd = request.getRequestDispatcher("/updateAccount.jsp");
			}else{
				System.out.println("staff no");
				rd = request.getRequestDispatcher("/");
			}
		}else{
			System.out.println("invalid");
			rd = request.getRequestDispatcher("");
		}
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd = null;
		Staff st = new Staff();

		//System.out.println(request.getParameter("password"));

		st.setStaffID(request.getParameter("staffID"));
		st.setStaffName(request.getParameter("staffname"));
		st.setStaffEmail(request.getParameter("email"));
		st.setStaffAddress(request.getParameter("address"));
		st.setStaffPassword(request.getParameter("password"));
		st.setStaffPhoneNo(request.getParameter("phoneno"));



		StaffDA sda = new StaffDA();

		System.out.println(st.getStaffID());
		System.out.println(st.getStaffName());
		System.out.println(st.getStaffEmail());
		System.out.println(st.getStaffAddress());
		System.out.println(st.getStaffPassword());
		System.out.println(st.getStaffPhoneNo());
		
		try {
			sda.updateStaff(st);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		//rd = request.getRequestDispatcher("/submitPreference");
		//rd.forward(request, response);
		 

	}

}

