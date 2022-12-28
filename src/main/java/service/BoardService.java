package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import util.DBUtil;
import vo.Board;

public class BoardService {
	private BoardDao boardDao;
	
	//modifyBoard
	public int modifyBoard(Board board) {
		Connection conn=null;
		boardDao= new BoardDao();
		int row=0;
		try {
			conn=DBUtil.getConnection();
			row=boardDao.modifyBoard(conn, board);
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
	
	
	//removeBoard
	public int removeBoard(int boardNo, String memberId) {
		Connection conn=null;
		boardDao=new BoardDao();
		int row=0;
		try {
			conn=DBUtil.getConnection();
			row=boardDao.removeBoard(conn, boardNo, memberId);
			conn.commit();
		}catch(Exception e) {
			try {
				conn.rollback();
			}catch(SQLException se) {
				se.printStackTrace();
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
	
	//addBoard
	public int setBoard(Board board) {
		Connection conn=null;
		boardDao= new BoardDao();
		int row=0;
		try {
			conn=DBUtil.getConnection();
			row=boardDao.insertBoard(conn, board);
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
	
	//boardOne
	public Board getBoardOne(int boardNo) {
		Connection conn=null;
		Board b= null;
		boardDao= new BoardDao();
		try {
			conn=DBUtil.getConnection();
			b=boardDao.selectBoardOne(conn, boardNo);
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
		return b;
	}
	
	//boardList
	public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage){
		ArrayList<Board> list=null;
		Connection conn=null;
		int beginRow=(currentPage-1)*rowPerPage+1;
		int endRow=beginRow+rowPerPage-1;
		boardDao= new BoardDao();
		
		try {
			conn=DBUtil.getConnection();
			//System.out.println("드라이버 연결 성공");
			list=boardDao.selectBoardListByPage(conn, beginRow, endRow);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
