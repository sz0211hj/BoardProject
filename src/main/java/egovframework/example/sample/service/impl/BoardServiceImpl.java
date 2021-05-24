package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;


@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired BoardMapper boardDAO;
	
	@Override
	public List<BoardVO> listBoard(BoardVO vo) {
		return boardDAO.listBoard(vo);
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) {
		return boardDAO.selectBoard(vo);
	}

	@Override
	public int insertBoard(BoardVO vo) {
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
	public List<BoardVO> logList(BoardVO vo) {
		return boardDAO.logList(vo);
	}


}
