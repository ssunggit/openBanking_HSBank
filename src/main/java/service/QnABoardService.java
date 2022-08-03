package service;

import java.util.List;

import model.qnaBoard.dao.QnABoardDAO;
import model.qnaBoard.vo.QnABoardVO;

public class QnABoardService {

	private QnABoardDAO qnaBoardDao;

	public QnABoardService() {
		qnaBoardDao = new QnABoardDAO();
	}

	public void addBoard(QnABoardVO qnaBoardVO) {
		qnaBoardVO.setNo(qnaBoardDao.selectBoardNo());
		
		qnaBoardDao.addBoard(qnaBoardVO);
		
	}

	public List<QnABoardVO> boardList() {
		List<QnABoardVO> boardList = qnaBoardDao.boardList();
		return boardList;
	}

	public QnABoardVO detailBoard(int no) {
		QnABoardVO board = qnaBoardDao.detailBoard(no);
		return board;
	}
	
	
}
