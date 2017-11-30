package Controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import DataAccess.ClientDA;
import DataAccess.ClientIllnessDA;
import DataAccess.DiseaseDA;
import DataAccess.PackageDA;
import DataAccess.RulesDA;
import Model.*;
import Model.Package;

import net.sourceforge.*;
import net.sourceforge.jFuzzyLogic.FIS;
import net.sourceforge.jFuzzyLogic.rule.Rule;
import oracle.net.aso.e;


@WebServlet(urlPatterns = {"/packDetails"}, name="packDetails")
public class viewPackageDetails extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public viewPackageDetails(){
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		Client c = new Client();

		c = (Client) request.getSession().getAttribute("client");
		
		int ruleNo= Integer.parseInt(request.getParameter("ruleNo"));
		String monthlypay = request.getParameter("monthlypay");
		System.out.println("viewPack "+monthlypay+" "+ruleNo);
		
		System.err.println(c.getClientID());
		
		
		RulePackage b = new RulePackage();
		//1
		request.setAttribute("recommendPackage", PackageDA.getPackageByRule(ruleNo));
		
		
		request.setAttribute("clientInfo", ClientDA.getClientByID(c.getClientID()));
		request.setAttribute("clientIllness", DiseaseDA.getClientDisease(c.getClientID()));
		//2
		request.setAttribute("packageDiease", DiseaseDA.getDieaseRule(ruleNo));
		
		request.setAttribute("ruleno", ruleNo);
		request.setAttribute("monthlypay", monthlypay);
		HttpSession sess = request.getSession(false);
		String name= (String)sess.getAttribute("username");  
		if(name!=null){
			request.getRequestDispatcher("/packageDetails.jsp").forward(request, response);
		}else{
			System.out.println("invalid");
			request.getRequestDispatcher("/packageDetailsClient.jsp").forward(request, response);
		}
		

	}


}





