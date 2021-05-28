package egovframework.example.sample.service;

import java.util.List;

public interface BoardService {
	
	
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
	
	//로그조회
	public List<BoardBackupVO> logList(BoardBackupVO vo);
	
}
