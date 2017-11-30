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

import DataAccess.ClientDA;
import DataAccess.StaffDA;
import Model.Client;
import Model.ClientIllness;
import Model.Staff;

@WebServlet(urlPatterns = {"/deleteStaff"}, name="deleteStaff")
public class deleteStaffHandler extends HttpServlet{

	public static final long serialVersionUID = 1L;



	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher rd = null;
		StaffDA sda = new StaffDA();
		String staffID = request.getParameter("staffID");
		
		System.out.println("masuk ke x" +staffID);
		
		sda.deleteStaff(staffID);
		request.setAttribute("staff", StaffDA.getAllStaff());



		rd = request.getRequestDispatcher("/adminIndex.jsp");
		rd.forward(request, response);
		

	}

}

