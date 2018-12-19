package com.spring.footprint.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.footprint.dao.ReviewBoardDao;
import com.spring.footprint.domain.ReviewBoard;
import com.spring.footprint.service.ReviewBoardService;

@Service("reviewBoardServiceImpl")
public class ReviewBoardServiceImpl implements ReviewBoardService{

	@Resource
	private ReviewBoardDao reviewBoardDao;

	@Override
	public void writeReviewBoard(ReviewBoard reviewBoard) throws Exception {
		reviewBoardDao.writeReviewBoard(reviewBoard);
	}

	@Override
	public ReviewBoard showReviewContent(int no) throws Exception {
		return reviewBoardDao.showReviewContent(no);
	}

	@Override
	public void updateReviewCount(int no) throws Exception {
		reviewBoardDao.updateReviewCount(no);
	}

	@Override
	public void updateReviewBoard(ReviewBoard reviewBoard) throws Exception {
		reviewBoardDao.updateReviewBoard(reviewBoard);
	}

	@Override
	public int totalReviewCount() throws Exception {
		return reviewBoardDao.totalReviewCount();
	}

	@Override
	public List<ReviewBoard> getReviewBoardList(int pageNo) throws Exception {
		return reviewBoardDao.getReviewBoardList(pageNo);
	}

}
