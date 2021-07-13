package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BlackListDAO;
import dao.PersonDAO;
import dto.BlackListDTO;
import dto.PersonDTO;


@WebServlet("*.ad")
public class AdminController extends HttpServlet {

  
    


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();

		String url = requestURI.substring(ctxPath.length());
		System.out.println("요청 URL : " +url);
		
		
		try {
			PersonDTO dto = new PersonDTO();
			PersonDAO dao =PersonDAO.getInstance();
			BlackListDAO Bdao = BlackListDAO.getInstance();
			BlackListDTO Bdto = new BlackListDTO();
			
		if(url.contentEquals("/admain.ad")) {
			System.out.println("어드민메인입장");
			List<PersonDTO> Memberlist =dao.memberList();
			List<BlackListDTO> blackList = Bdao.BlackListShow();
			
			request.setAttribute("Member", Memberlist);
			request.setAttribute("BlackList", blackList);
			
			request.getRequestDispatcher("admin/adminMain.jsp").forward(request,response);
			
			
		}
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
