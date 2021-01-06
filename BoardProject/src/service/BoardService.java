package service;

import dao.BoardDAO;
import dto.BoardDTO;

public class BoardService {
	private static BoardService instance = new BoardService();
	private BoardDAO dao;
	
	private BoardService() {
		dao = BoardDAO.getInstance();
	}

	public static BoardService getInstance() {
		if(instance==null)
			instance = new BoardService();
		return instance;
	}

	public BoardDTO insertBoardDTO(BoardDTO dto) throws Exception {
		int bno = dao.getBoardNO();
		dto.setBno(bno);
		dao.insertBoardDTO(dto);
		return dao.selectBoardDTO(bno);
	}
	
	public BoardDTO selectBoardDTO(int bno) {
		//조회수 카운트
		dao.addCount(bno);
		return dao.selectBoardDTO(bno);
	}
	
	public void LikeHate(int bno, int index) {
		dao.LikeHate(bno, index);
	}
}
