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
import DataAccess.DiseaseDA;
import DataAccess.PackageDA;
import DataAccess.StaffDA;
import Model.Client;
import Model.ClientIllness;
import Model.Disease;
import Model.Package;
import Model.Staff;

@WebServlet(urlPatterns = {"/managePackage"}, name="managePackage")
public class managePackageHandler extends HttpServlet{

	public static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		HttpSession sess = request.getSession(false);
		String username= (String)sess.getAttribute("username");
		String staff = (String)sess.getAttribute("staff");



		System.out.println("managePackage"+staff);

		request.setAttribute("pack", PackageDA.getAllPackage());
		if(username!=null){
			if(staff!=null){
				System.out.println("staff yes");
				rd = request.getRequestDispatcher("/viewPackageStaff.jsp");
			}else{
				System.out.println("staff no");
				rd = request.getRequestDispatcher("/viewPackage.jsp");
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

		//RequestDispatcher rd = null;
		DiseaseDA dda = new DiseaseDA();
		PackageDA pkda = new PackageDA();
		Package pk = new Package();
		Disease ds = new Disease();
		String packageID = request.getParameter("packageID");
		String action = request.getParameter("action");
		System.out.println("manage "+action);

		if(action!=null){

			if(action.equals("update")){
				System.out.println("masuk update lah");
				System.out.println("masuk update"+packageID);
				
				pk.setPackageID(packageID);
				pk.setPackageName(request.getParameter("packageName"));
				pk.setPackageType(request.getParameter("packageType"));
				
				ds.setDiseaseName(request.getParameter("illness"));
				
				System.out.println("masuk sini apadia haaa"+ds.getDiseaseName());
				
				dda.deleteDisease(packageID);
				dda.addDisease(ds, pk);
				
				try {
					pkda.updatePackage(pk);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

			}

			if(action.equals("delete")){
				System.out.println("masuk delete lah");
				System.out.println("masuk delete"+packageID);

				pkda.deletePackage(packageID);
				pkda.deletePackBrid(packageID);
				dda.deleteDisease(packageID);


				processRequest(request, response);



			}

			if(action.equals("view")){


				view(packageID, request, response);

			}


			/*
			String staffID = request.getParameter("username");

			System.out.println(staffID);

			StaffDA sda = new StaffDA();

			sda.deleteStaff(staffID);
			 */
			try{
				processRequest(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}



		}else{
			try{
				processRequest(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}



	}

	protected void view(String packageID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		System.out.println("masuk view"+packageID);

		request.setAttribute("pack", PackageDA.getPackageByID(packageID));
		request.setAttribute("item", PackageDA.getAllPackage());
		request.setAttribute("illness", DiseaseDA.getIllnessByID(packageID));

		rd = request.getRequestDispatcher("/managePackage.jsp");
		rd.forward(request, response);
	}
}


