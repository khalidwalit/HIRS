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
import DataAccess.PackageDA;
import DataAccess.RulesDA;
import Model.*;
import Model.Package;

import net.sourceforge.*;
import net.sourceforge.jFuzzyLogic.FIS;
import net.sourceforge.jFuzzyLogic.rule.Rule;
import oracle.net.aso.e;


@WebServlet(urlPatterns = {"/generateRecommendPackage"}, name="generateRecommendPackage")
public class generateRecommendPackage extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public generateRecommendPackage(){
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
		Package p = new Package();

		String DOB = c.getClientDOB();
		int age;

		age = kiraUmur(DOB);

		String ageCat = null;


		if(age<12){
			ageCat = "YOUNG";
		}else if(age>12&&age<18){
			ageCat = "TEENAGE";
		}else if(age>18&&age<30){
			ageCat = "ADULT";
		}else if(age>30){
			ageCat = "OLD";
		}


		double[] monthlyPayment = new double[3];
		double[] illness = new double[3];
		double job = 0;
		double[] smokestat = new double[3];
		double[] quit = new double[3];
		int gend;
		int quitStat = 0;

		if(c.getMonthlypayment().equals("100 - 300"))
		{
			monthlyPayment[0] = 100;
			monthlyPayment[1] = 200;
			monthlyPayment[2] = 300;
		}else if(c.getMonthlypayment().equals("301 - 500"))
		{
			monthlyPayment[0] = 300;
			monthlyPayment[1] = 400;
			monthlyPayment[2] = 500;
		}else if(c.getMonthlypayment().equals("501 - 700"))
		{
			monthlyPayment[0] = 500;
			monthlyPayment[1] = 600;
			monthlyPayment[2] = 700;
		}else if(c.getMonthlypayment().equals("701 - 900"))
		{
			monthlyPayment[0] = 700;
			monthlyPayment[1] = 800;
			monthlyPayment[2] = 900;
		}
		if(c.getClientIllness().equals("yes"))
		{
			illness[0] = 4.7;
			illness[1] = 5;
			illness[2] = 6;
		}else{
			illness[0] = 11;
			illness[1] = 17;
			illness[2] = 13.5;			
		}

		if(c.getJobclass().equals("JOB CLASS 1"))
		{
			job = 1;
		}else if(c.getJobclass().equals("JOB CLASS 2"))
		{
			job = 3.5;
		}else if(c.getJobclass().equals("JOB CLASS 3"))
		{
			job = 5.5;
		}else if(c.getJobclass().equals("JOB CLASS 4"))
		{
			job = 7.5;
		}

		if(c.getSmokingStatus().equals("Yes"))
		{
			smokestat[0] = 0.5;
			smokestat[1] = 1;
			smokestat[2] = 2.5;
		}else if(c.getSmokingStatus().equals("No"))
		{
			smokestat[0] = 3.5;
			smokestat[1] = 4.5;
			smokestat[2] = 5.5;
		}else if(c.getSmokingStatus().equals("Quit"))
		{
			quitStat = 1;
			smokestat[0] = 6.5;
			smokestat[1] = 7;
			smokestat[2] = 9;
			if(c.getQuitDuration().equals("Below 1 year"))
			{
				quit[0] = 0.5;
				quit[1] = 1;
				quit[2] = 1.5;
			}else if(c.getQuitDuration().equals("1 year to 2 years"))
			{
				quit[0] = 1.5;
				quit[1] = 2;
				quit[2] = 2.5;
			}else if(c.getQuitDuration().equals("2 years to 3 years"))
			{
				quit[0] = 2.5;
				quit[1] = 3;
				quit[2] = 3.5;
			}else if(c.getQuitDuration().equals("3 years and above"))
			{
				quit[0] = 3.5;
				quit[1] = 4;
				quit[2] = 4.5;
			}
		}

		if(c.getClientGender().equals("Male"))
		{
			gend = 1;
		}else
		{
			gend = 3;
		}

		/*
		int monthlyPayment = 200;
		double illness=4.7;
		int job = 7;
		double smokestat = 4;
		int quit = 0;
		int gend=1;
		 */
		/*
		if(c.getClientIllness().equals("yes"))
		{
			illness = 6;
		}else{
			illness = 14;			
		}

		if(c.getJobclass().equals("JOB CLASS 1"))
		{
			job = 1;
		}else if(c.getJobclass().equals("JOB CLASS 2"))
		{
			job = 3;
		}else if(c.getJobclass().equals("JOB CLASS 3"))
		{
			job = 5;
		}else if(c.getJobclass().equals("JOB CLASS 4"))
		{
			job = 7;
		}

		if(c.getMonthlypayment().equals("100 - 300"))
		{
			monthlyPayment = 200;
		}else if(c.getMonthlypayment().equals("301 - 500"))
		{
			monthlyPayment = 400;
		}else if(c.getMonthlypayment().equals("501 - 700"))
		{
			monthlyPayment = 600;
		}else if(c.getMonthlypayment().equals("701 - 900"))
		{
			monthlyPayment = 800;
		}

		if(c.getSmokingStatus().equals("Yes"))
		{
			smokestat = 1;
		}else if(c.getSmokingStatus().equals("No"))
		{
			smokestat = 4;
		}else if(c.getSmokingStatus().equals("Quit"))
		{
			smokestat = 7;
			if(c.getQuitDuration().equals("Below 1 year"))
			{
				quit = 1;
			}else if(c.getQuitDuration().equals("1 year to 2 years"))
			{
				quit = 2;
			}else if(c.getQuitDuration().equals("2 years to 3 years"))
			{
				quit = 3;
			}else if(c.getQuitDuration().equals("3 years and above"))
			{
				quit = 4;
			}
		}
		if(c.getClientGender().equals("Male"))
		{
			gend = 1;
		}else
		{
			gend = 3;
		}
		 */
		RulesDA rda = new RulesDA();

		List<Rules> RulesList = new ArrayList<>();
		Rules rule = new Rules();
		RulesList = rda.checkRules();

		Iterator it = RulesList.iterator();

		int ruleNo = 0;

		while(it.hasNext()){
			//System.out.println(ruleNo);
			rule = (Rules) it.next();

			if(ageCat.equals(rule.getAge()) && c.getJobclass().equals(rule.getJob()) && c.getSmokingStatus().toUpperCase().equals(rule.getSmoke()) &&  c.getClientIllness().toUpperCase().equals(rule.getIllness()) && c.getClientGender().toUpperCase().equals(rule.getGender()) && c.getMonthlypayment().equals(rule.getMonthlypay()) ){
				if(rule.getQuit()!=null)
				{
					if(c.getQuitDuration().equals(rule.getQuit()))
					{
						System.out.println("rules test NO x null:"+rule.getRuleno());	
						ruleNo = rule.getRuleno();
					}
				}
				else
				{
					System.out.println("rules test NO null:"+rule.getRuleno());
					ruleNo = rule.getRuleno();
				}
			}

		}	

		ClientDA cDa = new ClientDA();

		double[] value = new double[3];
		String[] result = new String[3];

		for(int i=0;i<3;i++){
			System.out.println(monthlyPayment[i]);
			value[i] = fuzzyRecommendValue(quitStat, age, job, smokestat[i], quit[i], illness[i], gend, monthlyPayment[i]);	
			//result[i] = String.format("%.2f", value[i]);
			result[i] = Double.toString(Math.floor(value[i]));
			System.out.println("Output value :"+result[i]);
		}


		request.setAttribute("RM1", String.format("%.2f",monthlyPayment[0]));
		request.setAttribute("RM2", String.format("%.2f",monthlyPayment[1]));
		request.setAttribute("RM3", String.format("%.2f",monthlyPayment[2]));
		request.setAttribute("value1", result[0]);
		request.setAttribute("value2", result[1]);
		request.setAttribute("value3", result[2]);
		request.setAttribute("ruleno", ruleNo);
		request.setAttribute("recommendPackage", PackageDA.getPackageByRule(ruleNo));
		request.setAttribute("clientInfo", ClientDA.getClientByID(c.getClientID()));

		System.out.println("TEST");

		//generateFuzzy file
		//request.getRequestDispatcher("/generateFuzzy").forward(request, response);
		//doGet(request, response);
		HttpSession sess = request.getSession(false);
		String name= (String)sess.getAttribute("username");  
		if(name!=null){
			request.getRequestDispatcher("/packageRecommend.jsp").forward(request, response);
		}else{
			System.out.println("invalid");
			request.getRequestDispatcher("/recommandPackage.jsp").forward(request, response);
		}

		//doGet(request, response);
	}


	private double fuzzyRecommendValue(int quitStat,int age,double job,double smokestat,double quit,double illness,int gend,double monthlyPayment){

		double value = 0;
		//Define Engine
		FIS FuzzyEngine = null;
		if(quitStat==0)
		{

			//GetFile
			InputStream fileFuzzy = getServletContext().getResourceAsStream("/WEB-INF/Fuzzy/Fuzzy.fcl");

			//LoadFile
			FuzzyEngine = FIS.load(fileFuzzy,true);

			//File Exception
			if( FuzzyEngine == null ) { 
				System.err.println("Can't load file: '" + fileFuzzy + "'");

			}

			//SetVariable
			FuzzyEngine.setVariable("age", age+1);
			FuzzyEngine.setVariable("jobclass", job);
			FuzzyEngine.setVariable("smokingstatus", smokestat);
			//FuzzyEngine.setVariable("quitduration", 1);
			FuzzyEngine.setVariable("illness", illness);
			FuzzyEngine.setVariable("gender", gend);
			FuzzyEngine.setVariable("monthlypayment", monthlyPayment);

			//Execute Engine
			FuzzyEngine.evaluate();

			//Get Value
			for(Rule r : FuzzyEngine.getFunctionBlock("Fuzzy").getFuzzyRuleBlock("No1").getRules())
			{
				//System.out.println(r);
			}	

			//COG
			value = FuzzyEngine.getVariable("recommend").getValue();

		}

		else
		{
			System.out.println("MEROKOK");
			//GetFile
			InputStream fileFuzzy = getServletContext().getResourceAsStream("/WEB-INF/Fuzzy/FuzzySmoke.fcl");

			//LoadFile
			FuzzyEngine = FIS.load(fileFuzzy,true);


			//File Exception
			if( FuzzyEngine == null ) { 
				System.err.println("Can't load file: '" + fileFuzzy + "'");
			}

			//SetVariable
			FuzzyEngine.setVariable("age", age+1);
			FuzzyEngine.setVariable("jobclass", job);
			FuzzyEngine.setVariable("smokingstatus", smokestat);
			FuzzyEngine.setVariable("quitduration", quit);
			FuzzyEngine.setVariable("illness", illness);
			FuzzyEngine.setVariable("gender", gend);
			FuzzyEngine.setVariable("monthlypayment", monthlyPayment);

			//Execute Engine
			FuzzyEngine.evaluate();

			//Get Value
			for(Rule r : FuzzyEngine.getFunctionBlock("Fuzzy").getFuzzyRuleBlock("No1").getRules())
			{
				//System.out.println(r);
			}		
			//COG
			value = FuzzyEngine.getVariable("recommend").getValue();

		}

		//FuzzyEngine.getVariable("recommend").chartDefuzzifier(true);
		//System.out.println(FuzzyEngine);
		return value;

	}

	private int kiraUmur(String DOB){

		int yearDOB = Integer.parseInt(DOB.substring(0,4));
		int monthDOB = Integer.parseInt(DOB.substring(5,7));
		int dayDOB = Integer.parseInt(DOB.substring(8,10));

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

		return age;

	}


}





