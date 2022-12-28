package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MemberDao;
import util.DBUtil;
import vo.Member;

public class MemberService {
	private MemberDao memberDao;
	
	//removeMember
	public int removeMember(String memberId) {
		this.memberDao= new MemberDao();
		Connection conn=null;
		int row=0;
		try {
			conn=DBUtil.getConnection();
			row=memberDao.removeMember(conn, memberId);
			System.out.println(row+"<==row: 서비스");
			conn.commit();
			System.out.println("커밋");
		}catch(Exception e) {
			try {
				conn.rollback();
				System.out.println("롤백");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//modifyMember
	public int modifyMember(Member paramMember,String memberName) {
		this.memberDao= new MemberDao();
		Connection conn=null;
		int row=0;
		try {
			conn=DBUtil.getConnection();
			row=memberDao.modifyMember(conn, paramMember, memberName);
			System.out.println(row+"<==row: 서비스");
			conn.commit();
		}catch(Exception e) {
			try {
				conn.rollback();
				System.out.println("롤백");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//memberPwCh
	public boolean memberPwCh(String memberPw) {
		this.memberDao= new MemberDao();
		Connection conn=null;
		boolean result= false;
		try {
			conn=DBUtil.getConnection();
			result=memberDao.memberPwCh(conn, memberPw);
			System.out.println(memberPw+"<==memberPw: 서비스");
			System.out.println(result+"<==result: 서비스");
			conn.commit();
		}catch(Exception e) {
			try {
				conn.rollback();
				System.out.println("롤백");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
		
	}
	
	//회원가입
	public int signInMember(Member paramMember) {
		this.memberDao= new MemberDao();
		Connection conn=null;
		int row = 0;
		try {
			conn=DBUtil.getConnection();
			row=memberDao.signInMember(conn, paramMember);
			conn.commit();
		}catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//회원가입 전 아이디 중복 검사
	public boolean selectMemberID(String memberId) {
		this.memberDao= new MemberDao();
		Connection conn=null;
		boolean result = false;
		try {
			conn=DBUtil.getConnection();
			result=memberDao.signInIdCK(conn, memberId);
			conn.commit();
		}catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//로그인
	public Member login(Member paramMember) {
		this.memberDao= new MemberDao();
		Connection conn=null;
		Member resultMember=null;
		try {
			conn=DBUtil.getConnection();
			resultMember=memberDao.loginMember(conn, paramMember);
		}catch(Exception e) {
		
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return resultMember;
	}
	
}
