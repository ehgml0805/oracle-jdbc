package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.*;
import vo.*;

@WebServlet("/board/removeBoard")
public class RemoveBoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 시에만 접근 가능 !=null 이어야 접근 가능
		HttpSession session= request.getSession();
		//로그인 전이면 null 
		//로그인 후면  로그인 한 값
		Member loginMember= (Member)session.getAttribute("loginMember");
		if(loginMember==null) { //로그인 안되면 홈으로 돌려보낼거 
			response.sendRedirect(request.getContextPath()+"/home"); //이동할 컨드롤러 URL
			return;
		}
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		System.out.println(boardNo+": no");
		String memberId=request.getParameter("memberId");
		System.out.println(memberId+"<==작성자");
		
		BoardService boardService= new BoardService();
		int row=boardService.removeBoard(boardNo,loginMember.getMemberId());
		
		if(row==1) {
			System.out.println("삭제 성공(컨트롤러)");
			response.sendRedirect(request.getContextPath()+"/board/boardList");
			return;
		}
		//서블릿에서 알림창 띄우기
		System.out.println("삭제 실패(컨트롤러)");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('삭제 실패'); location.href='"+request.getContextPath()+"/board/boardList"+"';</script>"); 
		writer.close();
	}
}
