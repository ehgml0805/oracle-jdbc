package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;

/**
 * Servlet implementation class RemoveMemberController
 */
@WebServlet("/member/removeMember")
public class RemoveMemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * forward-> /WEB_INF/view/member/removeMember.jsp
		 */
		//로그인 되어 있으면 여기 접근 금지
		//로그인 전에만 접근 가능 ==null 이어야 접근 가능
		HttpSession session= request.getSession();
		
		//로그인 전이면 null 
		//로그인 후면  로그인 한 값
		Member loginMember= (Member)session.getAttribute("loginMember");
		if(loginMember==null) { //로그인이 안되어 있다면 로그인 폼으로 보낼거
			response.sendRedirect(request.getContextPath()+"/home"); //이동할 컨드롤러 URL
			return;
		}

		//삭제하기 폼 view
		request.getRequestDispatcher("/WEB-INF/view/member/removeMember.jsp").forward(request, response); //합칠 파일 이름명
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String memberId= request.getParameter("memberId");
		String memberPw= request.getParameter("memberPw");
		
		
		MemberService memberService= new MemberService();
		if(memberService.memberPwCh(memberPw)==true) {
			System.out.println("비밀번호 일치");
			
		}else {
			System.out.println("비밀번호 불일치(컨트롤러)");
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		int row= memberService.removeMember(request.getParameter("memberId"));
		if(row==1) {
			System.out.println("삭제 성공");
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}else {
			System.out.println("삭제 실패:컨트롤러");
			//서블릿에서 알림창 띄우기
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('삭제 실패!'); location.href='"+request.getContextPath()+"/member/removeMember"+"';</script>"); 
			writer.close();
		}
		
	}

}
