package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardBackupVO;
import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;


@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired BoardMapper boardDAO;
	
	@Override
	public List<BoardVO> listBoard(BoardVO vo) {
		//전체 게시물 갯수 
		boardDAO.getCount(vo);
		return boardDAO.listBoard(vo);
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) {
		return boardDAO.selectBoard(vo);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		//글자 수 제한 java단에서 해주는것 넣기
		int result = boardDAO.insertBoard(vo);
		return result;
	}

	@Override
	public int updateBoard(BoardVO vo) {
	int result = boardDAO.updateBoard(vo);
		return result;
	}

	@Override
	public int deleteBoard(BoardVO vo) {
		int result = boardDAO.deleteBoard(vo);
		return result;
	}

	@Override
	public List<BoardBackupVO> logList(BoardBackupVO vo) {
		return boardDAO.logList(vo);
	}

	@Override
	public BoardBackupVO logListOne(BoardBackupVO vo) {
		return boardDAO.logListOne(vo);
	}

}
