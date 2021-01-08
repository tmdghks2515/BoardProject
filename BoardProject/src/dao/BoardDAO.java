package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.DBManager;
import dto.BoardDTO;
import dto.CommentDTO;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	DBManager manager;
	private BoardDAO() {
		manager = DBManager.getInstance();
	}

	public static BoardDAO getInstance() {
		if(instance == null)
			instance = new BoardDAO();
		return instance;
	}

	public void insertBoardDTO(BoardDTO dto) throws Exception {
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO BOARD(BNO,TITLE,WRITER,CONTENT) VALUES(?,?,?,?)";
		try {
			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getContent());
			int count = pstmt.executeUpdate();
			if(count == 0)
				throw new Exception("insert 실패");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(pstmt, null);
		}
		
	}

	public int getBoardNO() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT BNO_SEQ.NEXTVAL FROM DUAL";
		try {
			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(pstmt, rs);
		}
		return result;
	}

	public BoardDTO selectBoardDTO(int bno) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select bno,title,bdate,bcount,writer,content,blike,bhate from board where bno = "+bno;
		try {
			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				dto = new BoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(pstmt, rs);
		}
		
		return dto;
	}

	public void addCount(int bno) {
		PreparedStatement pstmt = null;
		String sql = "update board set bcount = bcount + 1 where bno = "+bno;
		try {
			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(pstmt, null);
		}
	}

	public void LikeHate(int bno,int index) {
		PreparedStatement pstmt = null;
		String sql1 = "update board set blike = blike + 1 where bno="+bno;
		String sql2 = "update board set bhate = bhate+ 1 where bno="+bno;
		try {
			if(index == 0)
				pstmt = manager.getSource().getConnection().prepareStatement(sql1);
			else
				pstmt = manager.getSource().getConnection().prepareStatement(sql2);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(pstmt, null);
		}
	}

	public ArrayList<BoardDTO> selectAll() {
		ArrayList<BoardDTO> li = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select bno,writer,title,bcount,bdate,blike,bhate,content from board order by bno desc";
		try {
			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				li.add(new BoardDTO(rs.getInt(1), rs.getString(3), rs.getString(5), rs.getInt(4), rs.getString(2), rs.getString(8), rs.getInt(6), rs.getInt(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(pstmt, rs);
		}
		return li;
	}

	public void insertCommantDTO(CommentDTO dto) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "insert into board_comment values(cno_seq.nextval,?,?,sysdate,?,0,0)";
		try {
			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt.setInt(1, dto.getbNo());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			int count = pstmt.executeUpdate();
			if(count != 1)
				throw new Exception("댓글 추가 실패");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(pstmt, null);
		}
	}

	public ArrayList<CommentDTO> selectComments(int bno) {
		ArrayList<CommentDTO> li = new ArrayList<CommentDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board_comment where bno = "+bno;
		try {
			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				li.add(new CommentDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(pstmt, rs);
		}
		return li;
	}
	
	
	
	
}
