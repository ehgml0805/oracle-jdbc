package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.*;


@WebServlet("/home")
public class HomeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 메뉴(로그인 전과 후에 따라 분기)
		 * forward-> /WEB_INF/view/home.jsp
		 * -전
		 * 1)로그인
		 * 2)회원가입
		 * -후
		 * 1)로그아웃
		 * 2)회원정보
		 * 3)게시판 목록
		 */
		HttpSession session= request.getSession();
		Member loginMember= (Member)session.getAttribute("loginMember");
		//System.out.println(loginMember+"<==로그인 한 멤버");
		//홈 뷰
		request.getRequestDispatcher("/WEB-INF/view/home.jsp").forward(request, response); //합칠 파일 이름명	
	}
}
