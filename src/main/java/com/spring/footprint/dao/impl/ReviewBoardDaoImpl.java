package com.spring.footprint.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.footprint.dao.ReviewBoardDao;
import com.spring.footprint.domain.ReviewBoard;

@Repository("reviewBoardDaoImpl")
public class ReviewBoardDaoImpl implements ReviewBoardDao{
	
	@Resource
	private SqlSession sqlSession;

	@Override
	public int writeReviewBoard(ReviewBoard reviewBoard) throws Exception {
		int result = sqlSession.insert("ReviewBoardMapper.writeReviewBoard", reviewBoard);
		return result;
	}

	@Override
	public ReviewBoard showReviewContent(int no) throws Exception {
		return sqlSession.selectOne("ReviewBoardMapper.showReviewContent", no);
	}

	@Override
	public void updateReviewCount(int no) throws Exception {
		sqlSession.update("ReviewBoardMapper.updateReviewCount", no);
	}

	@Override
	public void deleteReviewBoard(int no) throws Exception {
		sqlSession.delete("ReviewBoardMapper.deleteReviewBoard", no);
	}

	@Override
	public void updateReviewBoard(ReviewBoard reviewBoard) throws Exception {
		sqlSession.update("ReviewBoardMapper.updateReviewBoard", reviewBoard);
	}

	@Override
	public int totalReviewCount() throws Exception {
		int total = sqlSession.selectOne("ReviewBoardMapper.totalReviewCount");
		return total;
	}

	@Override
	public List<ReviewBoard> getReviewBoardList(int pageNo) throws Exception {
		return sqlSession.selectList("ReviewBoardMapper.getReviewBoardList");
	}
		
}
