package Controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import DataAccess.ClientDA;
import DataAccess.RulesDA;
import Model.Rules;

@WebServlet(urlPatterns = {"/generateFuzzy"}, name="generateFuzzy")
public class generateFuzzyInference extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public generateFuzzyInference(){
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		try {

			String filename = "FuzzyL.fcl";
			String fileName = "FuzzySmokeL.fcl";


			String absoluteFilePath = "";
			//C:\Users\User\workspace\HIRS\WebContent\WEB-INF\Fuzzy
			//C:\Users\Harith\eclipse-workspace
			absoluteFilePath = "C:" + File.separator + "Users" + File.separator + "Harith" + File.separator + "eclipse-workspace" + File.separator + "HIRS" + File.separator + "WebContent" +File.separator+"WEB-INF"+File.separator+"Fuzzy"+File.separator+""+filename;
			String absoluteFile = "C:" + File.separator + "Users" + File.separator + "Harith" + File.separator + "eclipse-workspace" + File.separator + "HIRS" + File.separator + "WebContent" +File.separator+"WEB-INF"+File.separator+"Fuzzy"+File.separator+""+fileName;

			//absoluteFilePath = workingDirectory + File.separator + filename;
			System.out.println("Final filepath : " + absoluteFilePath);
			System.out.println("Final filepath : " + absoluteFile);

			File file = new File(absoluteFilePath);
			File file1 = new File(absoluteFile);

			String checkFile = "";

			if(file.exists())

			{
				file.delete();
				//System.out.println("File is Updated");
				checkFile = "Fuzzy Engine is updated !";
			}else {
				file.createNewFile();
				//System.out.println("File is created!");
				checkFile = "Fuzzy Engine is created !";
			} 

			if(file1.exists())

			{
				file1.delete();
				System.out.println("File is Updated");
				checkFile = "Fuzzy Engine is updated !";
			}else {
				file1.createNewFile();
				System.out.println("File is created!");
				checkFile = "Fuzzy Engine is created !";
			} 

			//Write Content
			PrintWriter writer1 = new PrintWriter(file1);
			writer1.append("FUNCTION_BLOCK Fuzzy\n");
			writer1.append("VAR_INPUT\n");
			writer1.append("age : REAL;\n");
			writer1.append("jobclass : REAL;\n");
			writer1.append("monthlypayment : REAL;\n");
			writer1.append("smokingstatus : REAL;\n");
			writer1.append("quitduration : REAL;\n");
			writer1.append("illness : REAL;\n");
			writer1.append("gender : REAL;\n");
			writer1.append("END_VAR\n");


			writer1.append("VAR_OUTPUT\n");
			writer1.append("recommend : REAL;\n");
			writer1.append("END_VAR\n");

			writer1.append("FUZZIFY age\n");
			writer1.append(" TERM young := (0, 1) (8, 1) (15, 0) ; \n");
			writer1.append(" TERM teenage := (10, 0) (20, 1) (25, 0); \n");
			writer1.append(" TERM adult := (19, 0) (30, 1) (35, 0); \n");
			writer1.append(" TERM old := (29, 0) (31, 1) (90, 1) (100, 0); \n");
			writer1.append("END_FUZZIFY\n");

			writer1.append("FUZZIFY illness\n");
			writer1.append(" TERM no := (0, 1) (5, 1)  (7.5, 0) ; \n");
			writer1.append(" TERM yes := (10, 0)  (12.5, 1) (17.5, 1); \n");
			//writer1.append(" TERM severe := (19, 0) (25, 1) (31, 1); \n");
			writer1.append("END_FUZZIFY\n");

			writer1.append("FUZZIFY jobclass\n");
			writer1.append(" TERM jobclass1 := (0, 1) (1, 1) (3, 0) ; \n");
			writer1.append(" TERM jobclass2 := (2, 0) (3.5, 1) (5, 0); \n");
			writer1.append(" TERM jobclass3 := (4, 0) (5.5, 1) (7, 0); \n");
			writer1.append(" TERM jobclass4 := (6, 0) (7.5, 1) (9, 1); \n");
			writer1.append("END_FUZZIFY\n");

			writer1.append("FUZZIFY monthlypayment\n");
			writer1.append(" TERM low := (0, 0) (200, 1) (400, 0) ; \n");
			writer1.append(" TERM medium := (200, 0) (400, 1) (600, 0); \n");
			writer1.append(" TERM high := (400, 0) (600, 1) (800, 0); \n");
			writer1.append(" TERM veryhigh := (600, 0) (800, 1) (1000, 0); \n");
			writer1.append("END_FUZZIFY\n");

			writer1.append("FUZZIFY smokingstatus\n");
			writer1.append(" TERM yes := (0, 1) (1, 1) (3, 0) ; \n");
			writer1.append(" TERM no := (3, 0) (4.5, 1) (6, 0); \n");
			writer1.append(" TERM quit:= (6, 0) (7, 1) (9, 1); \n");
			writer1.append("END_FUZZIFY\n");

			writer1.append("FUZZIFY quitduration\n");
			writer1.append(" TERM stage1 := (0, 1) (1, 1) (2, 0) ; \n");
			writer1.append(" TERM stage2 := (1, 0) (2, 1) (3, 0); \n");
			writer1.append(" TERM stage3 := (2, 0) (3, 1) (4, 0); \n");
			writer1.append(" TERM stage4 := (3, 0) (4, 1) (5, 1); \n");
			writer1.append("END_FUZZIFY\n");

			writer1.append("FUZZIFY gender\n");
			writer1.append(" TERM male := (0, 1) (1, 1) (1.5, 1) (1.5, 0);  \n");
			writer1.append(" TERM female := (2.5, 0) (2.5, 1) (3, 1) (4, 1); \n");
			writer1.append("END_FUZZIFY\n");

			writer1.append("DEFUZZIFY recommend\n");
			writer1.append(" TERM low := (0,0) (20,1) (40,0); \n");
			writer1.append(" TERM medium := (20,0) (50,1) (80,0); \n");
			writer1.append(" TERM high := (60,0) (80,1) (100,1); \n");
			writer1.append(" METHOD : COG; \n");
			writer1.append(" DEFAULT := 0; \n");
			writer1.append("END_DEFUZZIFY\n");

			writer1.append("RULEBLOCK No1\n");
			writer1.append("AND : MIN;\n");
			writer1.append("ACT : MIN;\n");
			writer1.append("ACCU : MAX;\n");


			/////
			////
			////
			///

			//Write Content
			PrintWriter writer = new PrintWriter(file);
			writer.append("FUNCTION_BLOCK Fuzzy\n");
			writer.append("VAR_INPUT\n");
			writer.append("age : REAL;\n");
			writer.append("jobclass : REAL;\n");
			writer.append("monthlypayment : REAL;\n");
			writer.append("smokingstatus : REAL;\n");
			writer.append("quitduration : REAL;\n");
			writer.append("illness : REAL;\n");
			writer.append("gender : REAL;\n");
			writer.append("END_VAR\n");


			writer.append("VAR_OUTPUT\n");
			writer.append("recommend : REAL;\n");
			writer.append("END_VAR\n");

			writer.append("FUZZIFY age\n");
			writer.append(" TERM young := (0, 1) (8, 1) (15, 0) ; \n");
			writer.append(" TERM teenage := (10, 0) (20, 1) (25, 0); \n");
			writer.append(" TERM adult := (19, 0) (30, 1) (35, 0); \n");
			writer.append(" TERM old := (29, 0) (31, 1) (90, 1) (100, 0); \n");
			writer.append("END_FUZZIFY\n");

			writer.append("FUZZIFY illness\n");
			writer.append(" TERM no := (0, 1) (5, 1)  (7.5, 0) ; \n");
			writer.append(" TERM yes := (10, 0)  (12.5, 1) (17.5, 1); \n");
			//writer.append(" TERM severe := (19, 0) (25, 1) (31, 1); \n");
			writer.append("END_FUZZIFY\n");

			writer.append("FUZZIFY jobclass\n");
			writer.append(" TERM jobclass1 := (0, 1) (1, 1) (3, 0) ; \n");
			writer.append(" TERM jobclass2 := (2, 0) (3.5, 1) (5, 0); \n");
			writer.append(" TERM jobclass3 := (4, 0) (5.5, 1) (7, 0); \n");
			writer.append(" TERM jobclass4 := (6, 0) (7.5, 1) (9, 1); \n");
			writer.append("END_FUZZIFY\n");

			writer.append("FUZZIFY monthlypayment\n");
			writer.append(" TERM low := (0, 0) (200, 1) (400, 0) ; \n");
			writer.append(" TERM medium := (200, 0) (400, 1) (600, 0); \n");
			writer.append(" TERM high := (400, 0) (600, 1) (800, 0); \n");
			writer.append(" TERM veryhigh := (600, 0) (800, 1) (1000, 0); \n");
			writer.append("END_FUZZIFY\n");

			writer.append("FUZZIFY smokingstatus\n");
			writer.append(" TERM yes := (0, 1) (1, 1) (3, 0) ; \n");
			writer.append(" TERM no := (3, 0) (4.5, 1) (6, 0); \n");
			writer.append(" TERM quit:= (6, 0) (7, 1) (9, 1); \n");
			writer.append("END_FUZZIFY\n");

			writer.append("FUZZIFY quitduration\n");
			writer.append(" TERM stage1 := (0, 1) (1, 1) (2, 0) ; \n");
			writer.append(" TERM stage2 := (1, 0) (2, 1) (3, 0); \n");
			writer.append(" TERM stage3 := (2, 0) (3, 1) (4, 0); \n");
			writer.append(" TERM stage4 := (3, 0) (4, 1) (5, 1); \n");
			writer.append("END_FUZZIFY\n");

			writer.append("FUZZIFY gender\n");
			writer.append(" TERM male := (0, 1) (1, 1) (1.5, 1) (1.5, 0);  \n");
			writer.append(" TERM female := (2.5, 0) (2.5, 1) (3, 1) (4, 1); \n");
			writer.append("END_FUZZIFY\n");

			writer.append("DEFUZZIFY recommend\n");
			writer.append(" TERM low := (0,0) (20,1) (40,0); \n");
			writer.append(" TERM medium := (20,0) (50,1) (80,0); \n");
			writer.append(" TERM high := (60,0) (80,1) (100,1); \n");
			writer.append(" METHOD : COG; \n");
			writer.append(" DEFAULT := 0; \n");
			writer.append("END_DEFUZZIFY\n");

			writer.append("RULEBLOCK No1\n");
			writer.append("AND : MIN;\n");
			writer.append("ACT : MIN;\n");
			writer.append("ACCU : MAX;\n");

			RulesDA rda = new RulesDA();
			List<Rules> RulesList = new ArrayList<>();
			Rules rule = new Rules();
			RulesList = rda.checkRules();
			Iterator it = RulesList.iterator();

			while(it.hasNext()){

				rule = (Rules) it.next();

				writer1.append("RULE "+rule.getRuleno()+" : ");

				writer1.append("IF ");
				writer1.append("age IS "+rule.getAge().toLowerCase());

				writer1.append(" AND ");

				if(rule.getJob().equals("JOB CLASS 1"))
					writer1.append("jobclass IS jobclass1");
				if(rule.getJob().equals("JOB CLASS 2"))
					writer1.append("jobclass IS jobclass2");
				if(rule.getJob().equals("JOB CLASS 3"))
					writer1.append("jobclass IS jobclass3");
				if(rule.getJob().equals("JOB CLASS 4"))
					writer1.append("jobclass IS jobclass4");

				writer1.append(" AND ");
				writer1.append("smokingstatus IS "+rule.getSmoke().toLowerCase());

				if(rule.getSmoke().equals("QUIT"))
				{
					writer1.append(" AND ");

					if(rule.getQuit().equals("Below 1 year"))
						writer1.append("quitduration IS stage1");
					if(rule.getQuit().equals("1 year to 2 years"))
						writer1.append("quitduration IS stage2");
					if(rule.getQuit().equals("2 years to 3 years"))
						writer1.append("quitduration IS stage3");
					if(rule.getQuit().equals("3 years and above"))
						writer1.append("quitduration IS stage4");
				}
				writer1.append(" AND ");
				writer1.append("illness IS "+rule.getIllness().toLowerCase());

				writer1.append(" AND ");
				writer1.append("gender IS "+rule.getGender().toLowerCase());

				writer1.append(" AND ");
				if(rule.getMonthlypay().equals("100 - 300"))
					writer1.append("monthlypayment IS low");

				if(rule.getMonthlypay().equals("301 - 500"))
					writer1.append("monthlypayment IS medium");

				if(rule.getMonthlypay().equals("501 - 700"))
					writer1.append("monthlypayment IS high");

				if(rule.getMonthlypay().equals("701 - 900"))
					writer1.append("monthlypayment IS veryhigh");


				writer1.append(" THEN recommend IS "+rule.getRecommend());



				writer1.append(";\n");


				//XROKOK
				if(!rule.getSmoke().equals("QUIT"))
				{

					writer.append("RULE "+rule.getRuleno()+" : ");

					writer.append("IF ");
					writer.append("age IS "+rule.getAge().toLowerCase());

					writer.append(" AND ");

					if(rule.getJob().equals("JOB CLASS 1"))
						writer.append("jobclass IS jobclass1");
					if(rule.getJob().equals("JOB CLASS 2"))
						writer.append("jobclass IS jobclass2");
					if(rule.getJob().equals("JOB CLASS 3"))
						writer.append("jobclass IS jobclass3");
					if(rule.getJob().equals("JOB CLASS 4"))
						writer.append("jobclass IS jobclass4");

					writer.append(" AND ");
					writer.append("smokingstatus IS "+rule.getSmoke().toLowerCase());




					writer.append(" AND ");
					writer.append("illness IS "+rule.getIllness().toLowerCase());

					writer.append(" AND ");
					writer.append("gender IS "+rule.getGender().toLowerCase());

					writer.append(" AND ");
					if(rule.getMonthlypay().equals("100 - 300"))
						writer.append("monthlypayment IS low");

					if(rule.getMonthlypay().equals("301 - 500"))
						writer.append("monthlypayment IS medium");

					if(rule.getMonthlypay().equals("501 - 700"))
						writer.append("monthlypayment IS high");

					if(rule.getMonthlypay().equals("701 - 900"))
						writer.append("monthlypayment IS veryhigh");


					writer.append(" THEN recommend IS "+rule.getRecommend());



					writer.append(";\n");
				}

			}

			writer.append("END_RULEBLOCK\n");
			writer.append("END_FUNCTION_BLOCK");


			writer.close();
			//XROKOK

			writer1.append("END_RULEBLOCK\n");
			writer1.append("END_FUNCTION_BLOCK");


			writer1.close();

			request.setAttribute("file", checkFile);
			RequestDispatcher rd = null;

			String action=request.getParameter("action");
			System.out.println("apa action"+action);



			System.out.println("engine true");
			request.setAttribute("rule", RulesDA.getAllRule());

			rd = request.getRequestDispatcher("/listRule.jsp");
			rd.forward(request, response);



			/*request.getRequestDispatcher("/manageRule").forward(request, response);
			doGet(request, response);			*/

		} catch(Exception e) {
			System.out.println("error in writing a file"+e);
		}
	}

}
