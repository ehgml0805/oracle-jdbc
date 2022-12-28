package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import vo.Member;

/**
 * Servlet implementation class SignInFormController
 */
@WebServlet("/member/addMember")
public class addMemberController extends HttpServlet {
	//회원가입 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * forward-> /WEB_INF/view/member/addmember.jsp
		 */
		request.getRequestDispatcher("/WEB-INF/view/member/addMember.jsp").forward(request, response); //합칠 파일 이름명
	}
	
	
	//회원가입 액션 뷰x
	private MemberService memberService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String memberName= request.getParameter("memberName");
		//System.out.println(memberName+"<== 회원가입할 이름 ");
		String memberId= request.getParameter("memberId");
		System.out.println(memberId+"<== 회원가입할 아이디 ");
		String memberPw= request.getParameter("memberPw");
		System.out.println(memberPw+"<== 회원가입할 비번 ");
		
		Member paramMember= new Member();
		paramMember.setMemberName(memberName);
		paramMember.setMemberId(memberId);
		paramMember.setMemberPw(memberPw);
		
		//id 중복검사
		this.memberService=new MemberService();
		memberService.selectMemberID(memberId);
		if(memberService.selectMemberID(memberId)) {
			//System.out.println("중복된 아이디 입니다(컨트롤러)");
			//서블릿에서 알림창 띄우기
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('중복 아이디입니다.'); location.href='"+request.getContextPath()+"/member/addMember"+"';</script>"); 
			writer.close();
		}
		
		int row=memberService.signInMember(paramMember);
		if(row==1) {//성공 시 로그인 폼으로
			response.sendRedirect(request.getContextPath()+"/member/login"); //이름 변경 member/login
			return;
		}else {
			//회원가입 실패시
			System.out.println("회원가입 실패!(컨트롤러)");
			response.sendRedirect(request.getContextPath()+"/member/addMember"); 
			return;
		}
	
	}
	
}
