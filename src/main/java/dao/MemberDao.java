package dao;

import java.sql.*;

import oracle.jdbc.proxy.annotation.Pre;
import vo.*;

public class MemberDao {
	
	//removeMember
	public int removeMember(Connection conn,String memberId) throws Exception {
		int row=0;
		String sql="DELETE FROM member WHERE member_id=?";
		PreparedStatement stmt= conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		System.out.println(memberId+"<==memberId");
		row=stmt.executeUpdate();
		if(row==1) {
			System.out.println("삭제 성공");
			return 1;
		}
		stmt.close();
		return row;
	}	
	
	//modifyMember 음? String memberName 이거 추가하니까 되네?...왜?
	public int modifyMember(Connection conn, Member paramMember, String memberName) throws Exception {
		int row=0;
		String sql="UPDATE member SET member_name= ? , updatedate=sysdate WHERE member_id=?";
		PreparedStatement stmt= conn.prepareStatement(sql);
		stmt.setString(1, memberName);
		stmt.setString(2, paramMember.getMemberId());
		System.out.println(paramMember+"<==resultMember");
		row=stmt.executeUpdate();
		if(row==1) {
			System.out.println("수정 성공");
			return 1;
		}
		stmt.close();
		return row;
	}
	//memberPwCh
	public boolean memberPwCh(Connection conn, String memberPw) throws Exception{
		boolean result=false; // 
		String sql="SELECT member_id memberId, member_pw memberPw FROM member WHERE member_pw=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setString(1, memberPw);
		ResultSet rs=stmt.executeQuery();
		if(rs.next()){
			System.out.println("비밀번호 일치:DAO");
			return true; // 빼먹으니 false 뜸..
		}
		return result;
	}
	

	//로그인
	public Member loginMember(Connection conn,Member paramMember) throws Exception {
		Member resultMember=null;
		String sql="SELECT member_id memberId, member_name memberName FROM member WHERE member_id=? AND member_pw=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setString(1,paramMember.getMemberId());
		stmt.setString(2,paramMember.getMemberPw());
		ResultSet rs=stmt.executeQuery();
		if(rs.next()) {
			resultMember= new Member();
			resultMember.setMemberId(rs.getString("memberId"));
			resultMember.setMemberName(rs.getString("memberName"));
			//System.out.println(rs.getString("memberId")+":<--Dao");
			
		}
		rs.close();
		stmt.close();
		return resultMember;
	}
	
	// 회원가입 id 중복확인
	public boolean signInIdCK(Connection conn,String memberId) throws Exception {
		boolean result = false;// return 받아서 이리 온거니까 중복 아이디 아님
		String sql= "SELECT member_id memberId FROM member WHERE member_id=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setString(1,memberId);
		ResultSet rs= stmt.executeQuery();
		if(rs.next()) {
			System.out.println("중복된 아이디 입니다:DAO");
			result= true;
		}
		rs.close();
		stmt.close();
		return result;
	}
	
	//회원가입
	public int signInMember(Connection conn, Member paramMember) throws Exception{
		int row = 0;
		String sql="INSERT INTO member(member_id, member_pw, member_name, updatedate, createdate) VALUES (?, ?, ?, sysdate, sysdate)";
		PreparedStatement stmt= conn.prepareStatement(sql);
		stmt.setString(1, paramMember.getMemberId());
		stmt.setString(2, paramMember.getMemberPw());
		stmt.setString(3, paramMember.getMemberName());
		row=stmt.executeUpdate();
		if(row==1) {
			System.out.println("회원가입 성공:DAO");
		}
		stmt.close();
		return row;
	}
	
}
