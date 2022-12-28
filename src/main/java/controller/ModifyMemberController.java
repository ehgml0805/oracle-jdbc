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

@WebServlet("/member/modifyMember")
public class ModifyMemberController extends HttpServlet {
	//폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

		//수정하기 폼 view
		request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp").forward(request, response); //합칠 파일 이름명
	}
	
	//액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 전에만 접근 가능 ==null 이어야 접근 가능
		HttpSession session= request.getSession();
		//로그인 전이면 null 
		//로그인 후면 (!=null) 로그인 한 값
		Member loginMember= (Member)session.getAttribute("loginMember");
		if(loginMember==null) {  //로그인이 안되어 있다면 홈으로 보낼거
			response.sendRedirect(request.getContextPath()+"/home"); //이동할 컨드롤러 URL
			return;
		}
		request.setCharacterEncoding("utf-8");
		
		//폼에서 받아오기
		String memberName= request.getParameter("memberName");
		System.out.println(memberName+"수정 할 이름");
		String memberId= request.getParameter("memberId");
		System.out.println(memberId+"아이디");
		String memberPw= request.getParameter("memberPw");
		System.out.println(memberPw+"비밀번호");
		
		Member paramMember= loginMember;
		paramMember.setMemberId(memberId);
		paramMember.setMemberPw(memberPw);
		paramMember.setMemberName(memberName);
		
		MemberService memberService= new MemberService();
		if(memberService.memberPwCh(memberPw)==true) {
			System.out.println("비밀번호 일치");
			
		}else {
			System.out.println("비밀번호 불일치(컨트롤러)");
			response.sendRedirect(request.getContextPath()+"/member/modifyMember");
			return;
		}
		
		Member resultMember = memberService.modifyMember(paramMember);
		System.out.println(resultMember+"<==resultMember(컨트롤러)");
		
		
		System.out.println("수정 성공");
		response.sendRedirect(request.getContextPath()+"/member/memberOne");
		return;

	}
		
}


