package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PersonDAO;
import dto.PersonDTO;


@WebServlet("*.idf")
public class IdFindController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();

		String url = requestURI.substring(ctxPath.length());
		System.out.println("요청 URL : " +url);

		try {
			PersonDAO dao = PersonDAO.getInstance();
			
			if(url.contentEquals("/IdFind.idf")) {
				String Name = request.getParameter("userName");
				String Contact =request.getParameter("userNumber"); 
				String Email = request.getParameter("userEmail");


				String  user_id = dao.findId(Name,Contact,Email);

				request.getRequestDispatcher("Signup/signupResult.jsp").forward(request, response);

			}

		}catch(Exception e){
			e.printStackTrace();}
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
