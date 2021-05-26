package egovframework.example.sample.service.impl;

import java.util.List;


import egovframework.example.sample.service.BoardBackupVO;
import egovframework.example.sample.service.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface BoardMapper {
	//게시판 페이징
	public int getCount(BoardVO vo);
	
	//전체조회
	public List<BoardVO> listBoard(BoardVO vo);

	//단건조회
	public BoardVO selectBoard(BoardVO vo);
	
	//등록
	public int insertBoard(BoardVO vo);
	
	//수정
	public int updateBoard(BoardVO vo);
	
	//삭제
	public int deleteBoard(BoardVO vo);
	
	//로그 페이징
	public int getCountLog(BoardBackupVO vo);
	
	//로그조회
	public List<BoardBackupVO> logList(BoardBackupVO vo);

	//로그단건조회
	public BoardBackupVO logListOne(BoardBackupVO vo);
}
