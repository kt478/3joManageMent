package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.B_CommentsDAO;
import dto.B_CommentsDTO;
import dto.PersonDTO;

@WebServlet("*.fbc")  // *.freeBoardComments
public class b_CommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println("요청된 연결 : " + cmd);
		
		try {
			
			B_CommentsDAO cdao = B_CommentsDAO.getInstance(); 
			
			// 댓글 작성
			if(cmd.contentEquals("/writeCmt.fbc")) {
				String writer = ((PersonDTO)request.getSession().getAttribute("login")).getId();
				String comments = request.getParameter("comments");
				String parent_seq = request.getParameter("parent_seq");
				
				B_CommentsDTO dto = new B_CommentsDTO(0, writer, comments, null, Integer.parseInt(parent_seq));
				int result = cdao.insertCmt(dto);
				response.sendRedirect("viewProc.fb?seq=" + parent_seq);
			
			// 댓글 수정
			} else if (cmd.contentEquals("/modifyCmt.fbc")) {

				int seq = Integer.parseInt(request.getParameter("seq"));
				String comments = request.getParameter("cmt");
				int parent_seq = Integer.parseInt(request.getParameter("parent_seq"));
				
				int result = cdao.modifyCmt(seq, comments);
				response.sendRedirect("viewProc.fb?seq=" + parent_seq);

			// 댓글 삭제
			} else if(cmd.contentEquals("/deleteCmt.fbc")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int parent_seq = Integer.parseInt(request.getParameter("parent_seq"));
				
				int result = cdao.deleteCmt(seq);
				response.sendRedirect("viewProc.fb?seq=" + parent_seq);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
