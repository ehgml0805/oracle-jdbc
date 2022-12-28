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
import vo.Member;

@WebServlet("/member/login")
public class LoginContrller extends HttpServlet {
	private MemberService memberService;
	//로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 되어 있으면 여기 접근 금지
		//로그인 전에만 접근 가능 ==null 이어야 접근 가능
		HttpSession session= request.getSession();
		//로그인 전이면 null 
		//로그인 후면  로그인 한 값
		Member loginMember= (Member)session.getAttribute("loginMember");
		if(loginMember!=null) { //로그인이 된 상태면 홈으로 
			response.sendRedirect(request.getContextPath()+"/home"); //이동할 컨드롤러 URL
			return;
		}
		//로그인 폼 view
		request.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(request, response); //합칠 파일 이름명
	}
	
	//로그인 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 로그인 세션 정보:session.setAttribute("loginMember",member타입)
		 * 
		 */
		//로그인 전에만 접근 가능 ==null 이어야 접근 가능
		HttpSession session= request.getSession();
		//로그인 전이면 null 
		//로그인 후면 (!=null) 로그인 한 값
		Member loginMember= (Member)session.getAttribute("loginMember");
		if(loginMember!=null) { //로그인이 된 상태면 홈으로 
			response.sendRedirect(request.getContextPath()+"/home"); //이동할 컨드롤러 URL
			return;
		}
		request.setCharacterEncoding("utf-8");
		//폼에서 받아오기
		String memberId= request.getParameter("memberId");
		//System.out.println(memberId+": 로그인 할 아이디");
		String memberPw= request.getParameter("memberPw");
		//System.out.println(memberPw+": 로그인 할 아이디의 비밀번호");
		
		Member paramMember= new Member(); // request 파라미터 값으로 바인딩
		paramMember.setMemberId(memberId);
		paramMember.setMemberPw(memberPw);
		
		this.memberService= new MemberService();
		Member returnMember=memberService.login(paramMember);
		//System.out.println(returnMember+"<--로그인 결과");
		
		if(returnMember == null) {// 로그인 실패
			//서블릿에서 알림창 띄우기
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인 실패'); location.href='"+request.getContextPath()+"/member/login"+"';</script>"); 
			writer.close();
		}else if(returnMember != null) {
			session.setAttribute("loginMember", returnMember);
			response.sendRedirect(request.getContextPath()+"/home"); // 로그인이 되면 Home으로 보내줄거
			return;
		}
	}

}
