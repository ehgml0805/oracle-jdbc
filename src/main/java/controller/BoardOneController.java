package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/member/boardOne")//@WebServlet(접근시 사용할 URI)
public class BoardOneController extends HttpServlet {
	private BoardService boardService;
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
		//System.out.println(boardNo+": no");
		
		this.boardService=new BoardService();
		Board b= boardService.getBoardOne(boardNo);
		
		//view와 공유할 모델데이터를 설정		
		request.setAttribute("b", b);
		
		request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp").forward(request, response); //합칠 파일 이름명
	}

}
