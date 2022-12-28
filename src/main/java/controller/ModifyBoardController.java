package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;


@WebServlet("/board/modifyBoard")
public class ModifyBoardController extends HttpServlet {
	private BoardService boardService;
	//수정 폼
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
		
		//
		request.getRequestDispatcher("/WEB-INF/view/board/modifyBoard.jsp").forward(request, response); //합칠 파일 이름명
	}
	
	//수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle=request.getParameter("boardTitle");
		String boardContent=request.getParameter("boardContent");
		String memberId=request.getParameter("memberId");
		
		Board board=new Board();
		board.setBoardNo(boardNo);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		board.setMemberId(memberId);
		
		this.boardService=new BoardService();
		int row= boardService.modifyBoard(board);
		if(row==1) {
			System.out.println("수정 성공(컨트롤러)");
			response.sendRedirect(request.getContextPath()+"/board/boardList");
			return;
		}
		//서블릿에서 알림창 띄우기
		System.out.println("수정 실패(컨트롤러)");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('수정 실패'); location.href='"+request.getContextPath()+"/board/boardList"+"';</script>"); 
		writer.close();
	}
}
