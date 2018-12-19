package com.spring.footprint.service;

import java.util.List;

import com.spring.footprint.domain.ReviewBoard;

public interface ReviewBoardService {
	public void writeReviewBoard(ReviewBoard reviewBoard) throws Exception;
	public ReviewBoard showReviewContent(int no) throws Exception;
	public void updateReviewCount(int no) throws Exception;
	public void updateReviewBoard(ReviewBoard reviewBoard) throws Exception;
	public int totalReviewCount() throws Exception;
	public List<ReviewBoard> getReviewBoardList(int pageNo) throws Exception;
}
