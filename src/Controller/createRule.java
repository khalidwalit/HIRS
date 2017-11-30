package Controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import DataAccess.RulesDA;

@WebServlet(urlPatterns = {"/createRule"}, name="createRule")
public class createRule extends HttpServlet{

	public static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private static String FILENAME = null;
	private static final String UPLOAD_DIRECTORY = "upload" ;

	private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3 ;  // 3MB
	private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40 ; // 40MB
	private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50 ; // 50MB

	List uploadedFiles = null ;
	Iterator iterator = null ;
	String uploadPath = null ;
	File uploadDir = null ;
	String fileName = null ;
	String filePath = null ;
	File storeFile = null ;
	FileItem item = null ;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		// checks if the request actually contains upload file
		if (!ServletFileUpload.isMultipartContent(request)) 
		{
			PrintWriter writer = response.getWriter() ;
			writer.println("Request does not contain upload data") ;
			writer.flush() ;
			return ;
		}

		// configures upload settings
		DiskFileItemFactory factory = new DiskFileItemFactory() ;
		factory.setSizeThreshold(THRESHOLD_SIZE) ;
		factory.setRepository(new File(System.getProperty("java.io.tmpdir"))) ;

		ServletFileUpload upload = new ServletFileUpload(factory) ;
		upload.setFileSizeMax(MAX_FILE_SIZE) ;
		upload.setSizeMax(MAX_REQUEST_SIZE) ;

		// constructs the base directory path to store upload file
		uploadPath = getServletContext().getRealPath("")+ File.separator + UPLOAD_DIRECTORY ;
		// creates the base directory if it does not exist
		uploadDir = new File(uploadPath) ;
		if (!uploadDir.exists()) 
		{
			uploadDir.mkdir() ;
		}

		// parses the request's content to extract file data
		try {
			uploadedFiles = upload.parseRequest(request) ;
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		iterator = uploadedFiles.iterator() ;

		// iterates over form's fields
		while (iterator.hasNext()) 
		{
			item = (FileItem) iterator.next() ;
			// processes only fields that are not form fields
			if (!item.isFormField()) 
			{                   
				fileName = new File(item.getName()).getName() ;


				filePath = uploadPath + File.separator + fileName ;
				storeFile = new File(filePath) ;

				// saves the file on disk
				try {
					item.write(storeFile) ;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		System.out.println(filePath);
		FILENAME = filePath;
		//getServletContext().getRequestDispatcher("/result.jsp").forward(request, response);



		BufferedReader br = null;
		FileReader fr = null;

		RulesDA rda = new RulesDA();
		//Rules r = new Rules();

		try {

			fr = new FileReader(FILENAME);
			br = new BufferedReader(fr);

			String sCurrentLine;

			br = new BufferedReader(new FileReader(FILENAME));

			while ((sCurrentLine = br.readLine()) != null) {

				rda.createRule(sCurrentLine);


				//System.out.println(sCurrentLine);
				//String[] parts = sCurrentLine.split(";");
				//int size = parts.length;
				//System.out.println("Line "+sCurrentLine);
				//for(int i=0;i<size;i++){


				//System.out.println(parts[i]);

				//	}


			}

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				if (br != null){
					br.close();
					System.out.println("close br");
				}
				if	(fr != null){
					fr.close();
					System.out.println("close fr");
				}

			} catch (IOException ex) {

				ex.printStackTrace();

			}

		}

		rd = request.getRequestDispatcher("/generateFuzzy");
		rd.forward(request, response);

	}


}

