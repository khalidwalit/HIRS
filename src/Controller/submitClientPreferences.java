package Controller;


import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
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
import DataAccess.ClientIllnessDA;
import DataAccess.DiseaseDA;
import DataAccess.StaffDA;
import Model.Client;
import Model.ClientIllness;

@WebServlet(urlPatterns = {"/submitPreference"}, name="clientPreferences")
public class submitClientPreferences extends HttpServlet{

	public static final long serialVersionUID = 1L;

	public submitClientPreferences(){
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException{
		RequestDispatcher rd = null;

		//HttpSession session=request.getSession(false);

		HttpSession sess = request.getSession(false);
		String name= (String)sess.getAttribute("username");  
		if (name != null) {

			request.setAttribute("illness", DiseaseDA.getIllness());

			rd = request.getRequestDispatcher("/submitClientPreference.jsp");

		}else{
			System.out.println("invalid");
			request.setAttribute("illness", DiseaseDA.getIllness());
			rd = request.getRequestDispatcher("/submitPreference.jsp");
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

		ClientIllness cI = new ClientIllness();

		String clientID = request.getParameter("clientID");
		String clientName = request.getParameter("clientName");
		String jobClass = request.getParameter("jobClass");
		String clientSalary = request.getParameter("salary");
		String disease = request.getParameter("penyakit");
		String smokingStatus = request.getParameter("smoke");
		String monthlyPayment = request.getParameter("monthlyPayment");		
		String DOB = request.getParameter("DOB");
		String clientGender = request.getParameter("gender");
		String quitSmoke = null;

		System.out.println("clientiD " +clientID);

		ClientIllnessDA cida = new ClientIllnessDA();

		if(disease.equals("No")){
			System.out.println("NULL");
		}else{
			cI.setClientIllness(request.getParameterValues("disease"));
			cida.addClientIllness(clientID,cI);	
		}

		if(smokingStatus.equals("Quit")){
			quitSmoke = request.getParameter("stop");
		}

		Date dateofbirth;
		//Date date = new Date();
		int umur;
		//Kira Umur dari tarikh lahir		
		int dayDOB = Integer.parseInt(DOB.substring(0,2));
		int monthDOB = Integer.parseInt(DOB.substring(3,5));
		int yearDOB = Integer.parseInt(DOB.substring(6,10));

		DateFormat df = new SimpleDateFormat("yyyy");
		java.util.Date date = new java.util.Date();
		int thisYear = Integer.parseInt(df.format(date));

		df = new SimpleDateFormat("MM");
		date = new java.util.Date();
		int thisMonth = Integer.parseInt(df.format(date));


		df = new SimpleDateFormat("dd");
		date = new java.util.Date();
		int thisDay = Integer.parseInt(df.format(date));

		int age = thisYear - yearDOB;

		if(thisMonth < monthDOB){
			age = age - 1;
		}

		if(thisMonth == monthDOB && thisDay < dayDOB){
			age = age-1;
		}


		//End kira umur dari tarikh lahir

		String DOB1 = DOB.substring(6,10) +"-"+ DOB.substring(3,5)+"-" + DOB.substring(0,2);



		Client c = new Client(clientID,clientName,jobClass,clientGender, disease, smokingStatus, quitSmoke, monthlyPayment, DOB1);

		ClientDA cDa = new ClientDA();
		cDa.submitClientPreference(c);

		request.getSession().setAttribute("client", c);

		//request.setAttribute("clientID", clientID);
		request.getRequestDispatcher("/generateRecommendPackage").forward(request, response);
		doGet(request, response);

	}

}