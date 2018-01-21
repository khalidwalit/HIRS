package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DataAccess.DiseaseDA;
import DataAccess.PackageDA;
import Model.Disease;
import Model.Package;

@WebServlet(urlPatterns = {"/createPackage"}, name="createPackage")
public class createPackageHandler extends HttpServlet{

	public static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException{
		RequestDispatcher rd = null;
		HttpSession sess = request.getSession(false);
		String username= (String)sess.getAttribute("username");
		String staff = (String)sess.getAttribute("staff");
		


		System.out.println("createPackage"+staff);

		
		if(username!=null){
		if(staff!=null){
			rd = request.getRequestDispatcher("/registerPackageStaff.jsp");
		}else{
			rd = request.getRequestDispatcher("/registerPackageAdmin.jsp");
		}
		}else{
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

		RequestDispatcher rd = null;
		Package pk = new Package();
		Disease ds = new Disease();
		HttpSession sess = request.getSession(false);
		String username= (String)sess.getAttribute("username");
		String staff = (String)sess.getAttribute("staff");
		
		
		ds.setDiseaseName(request.getParameter("illness"));
		
		pk.setPackageID(request.getParameter("packageID"));
		
		pk.setPackageName(request.getParameter("packageName"));
		pk.setPackageType(request.getParameter("packageType"));
		
		System.out.println(pk.getPackageID());
		System.out.println(pk.getPackageType());
		System.out.println(ds.getDiseaseName());
		
		System.out.println(staff);
		
		DiseaseDA dda = new DiseaseDA();
		PackageDA pkda = new PackageDA();
		
		pkda.registerPackage(pk);
		pkda.regPackBridg(pk, username, staff);
		dda.addDisease(ds, pk);
		
		
		
		String[] parts = ds.getDiseaseName().split(",");
		int size = parts.length;
		
		for(int i=0; i <size;i++){
			System.out.println(parts[i]);
		}
		
		if(staff!=null){
			
			rd = request.getRequestDispatcher("managePackage");
		}else{
			
			rd = request.getRequestDispatcher("managePackage");
		}
		rd.forward(request, response);

	}

}

