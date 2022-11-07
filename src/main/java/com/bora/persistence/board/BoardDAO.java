package com.bora.persistence.board;

import java.util.List;

import com.bora.domain.board.BoardVO;
import com.bora.domain.board.PageMakerVO;
import com.bora.domain.board.PageVO;

public interface BoardDAO {
	// 1. 글쓰기 insertBoard(vo)
	public void insertBoard(BoardVO vo) throws Exception;

	// 2. 글 전체 목록 조회
	public List<BoardVO> getBoardListAll() throws Exception;

	// 2-1. 페이징 처리 적용한 글 목록 조회
	public List<BoardVO> getBoardListPage(PageVO vo) throws Exception;
	
		// 2-2. 페이징 처리 적용한 글 목록 조회 (카테고리)
		public List<BoardVO> getBoardListCtgr(PageMakerVO pm, String ctgr) throws Exception;
		
			public int getBoardCnt() throws Exception;	
			
			public int getBoardCntCTGR(String ctgr) throws Exception;
	
	// 3. 글 1개 정보 가져오기
	public BoardVO getBoard(Integer bno) throws Exception;

	// 3-1. 글 조회수 1 증가
	public void updateReadCount(Integer bno) throws Exception;
	
	// 4-1. 글 수정하기
	public Integer updateBoard(BoardVO vo/* , String id */) throws Exception;

	// 5. 글 삭제하기
	public int deleteBoard(Integer bno/* , String id */) throws Exception;

	// 6. id -> 닉네임 끌고 오기
	public String getNick(String id) throws Exception;
	
}