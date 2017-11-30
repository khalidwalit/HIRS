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
import Model.Rules;
import Model.Staff;

@WebServlet(urlPatterns = {"/manageRule"}, name="manageRule")
public class manageRules extends HttpServlet{

	public static final long serialVersionUID = 1L;
	RequestDispatcher rd = null;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException{
		
		HttpSession sess = request.getSession(false);
		String username= (String)sess.getAttribute("username");
		String staff = (String)sess.getAttribute("staff");

		

			request.setAttribute("rule", RulesDA.getAllRule());
			if(username!=null){
				if(staff!=null){
				System.out.println("staff yes");
				HttpSession session = request.getSession(true);
				session.invalidate();
				rd = request.getRequestDispatcher("");
			}else{
				System.out.println("staff no");
				rd = request.getRequestDispatcher("/listRule.jsp");
			}
		}else{
			System.out.println("session invalid");
			response.sendRedirect("");
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

		Rules r = new Rules();
		RulesDA rda = new RulesDA();

		String action= request.getParameter("action");

		
		
		System.out.println("test manageRule"+action);
		if(action!=null){
			
			r.setRuleno(Integer.parseInt(request.getParameter("ruleno")));
			r.setAge(request.getParameter("age"));
			r.setGender(request.getParameter("gender"));
			r.setIllness(request.getParameter("illness"));
			r.setJob(request.getParameter("job"));
			r.setMonthlypay(request.getParameter("monthlypay"));
			r.setQuit(request.getParameter("quit"));
			r.setRecommend(request.getParameter("recommend"));
			r.setSmoke(request.getParameter("smoke"));
			
			if(action.equals("update")){
				System.out.println("update Rule");
				System.out.println("ruleno"+r.getRuleno());
				
				try {
					rda.updateRule(r);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//request.setAttribute("rule", RulesDA.getAllRule());

				rd = request.getRequestDispatcher("/generateFuzzy");
				rd.forward(request, response);
				
				
			}
			if(action.equals("delete")){

				System.out.println("delete servlet");
				rda.deleteRule(r.getRuleno());
				
				//request.setAttribute("rule", RulesDA.getAllRule());

				rd = request.getRequestDispatcher("/generateFuzzy");
				rd.forward(request, response);
			}
		}else{
			try{
				processRequest(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
	}

}



