package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/boardList")
public class BoardListController extends HttpServlet {
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
		int currentPage=1; //1페이지부터 시작
		if(request.getParameter("currentPage")!=null) {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage=10; //10개씩 출력할거
		if(request.getParameter("rowPerPage")!=null) { // 안넘어오면 기본 값 10(개씩 볼거)
			rowPerPage=Integer.parseInt(request.getParameter("rowPerPage"));
		}
		
		this.boardService= new BoardService();
		ArrayList<Board> list= boardService.getBoardListByPage(currentPage, rowPerPage);
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage); //view에서 필요해
		request.setAttribute("rowPerPage", rowPerPage);
		
		/*
		 * 게시글 입력
		 * 글 상세보기- 수정삭제
		 * */
		request.getRequestDispatcher("/WEB-INF/view/board/boardList.jsp").forward(request, response);
	}

}
