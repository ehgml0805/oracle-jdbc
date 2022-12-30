package dao;

import java.sql.*;
import java.util.ArrayList;

import oracle.jdbc.proxy.annotation.Pre;
import vo.Board;

public class BoardDao {
	
	//boardOne
	public Board selectBoardOne(Connection conn, int boardNo) throws Exception {
		String sql = "SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId , createdate, updatedate FROM board WHERE board_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		ResultSet rs = stmt.executeQuery();
		Board b = new Board();
		if(rs.next()) {
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setBoardContent(rs.getString("boardContent"));
			b.setMemberId(rs.getString("memberId"));
			b.setCreatedate(rs.getString("createdate"));
			b.setUpdatedate(rs.getString("updatedate"));
			b.setBoardNo(rs.getInt("boardNo"));
		}
		return b;
	}
	
	//boardList
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql ="SELECT board_no boardNo, board_title boardTitle, createdate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, createdate"
				+ "			FROM (SELECT board_no, board_title, createdate"
				+ "					FROM board ORDER BY  TO_NUMBER(board_no) DESC))" //TO_NUMBER 숫자로 형변환 해주기
				+ " WHERE rnum BETWEEN ? AND ?"; // WHERE rnum >=? AND rnum <=?;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		return list;
	}
	
	//addBoard
	public int insertBoard(Connection conn, Board board) throws Exception {
		int row=0;
		String sql="INSERT INTO board(board_no, board_title, board_content, member_id, updatedate, createdate) VALUES (board_seq.nextval,?,?,?,sysdate,sysdate)";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getMemberId());
		row=stmt.executeUpdate();
		if(row==1) {
			System.out.println("Dao: 문의 추가 성공");
			return 1;
		}
		return row;
	}
	
	//removeBoard
	public int removeBoard(Connection conn, int boardNo, String memberId) throws Exception{
		int row=0;
		String sql="DELETE FROM board WHERE board_no=? AND member_id=?";
		PreparedStatement stmt= conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		stmt.setString(2, memberId);
		row=stmt.executeUpdate();
		if(row==1){
			System.out.println("삭제 성공: Dao");
		}
		return row;
	}
	
	//modifyBoard
	public int modifyBoard(Connection conn, Board board) throws Exception{
		int row=0;
		String sql="UPDATE board SET board_title=?, board_content=?, updatedate=sysdate WHERE board_no=? AND member_id=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setInt(3, board.getBoardNo());
		stmt.setString(4, board.getMemberId());
		row=stmt.executeUpdate();
		if(row==1) {
			System.out.println("수정 성공: Dao");
		}
		return row;
	}
	
}
