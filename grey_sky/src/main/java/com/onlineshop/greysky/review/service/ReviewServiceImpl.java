package com.onlineshop.greysky.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineshop.greysky.review.dao.ReviewDAO;
import com.onlineshop.greysky.review.vo.ReviewVO;

@Service("reviewService")
//@Transactional(propagation = Propagation.REQUIRED)
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDAO;
	
	
	public List<ReviewVO> listReview() throws Exception{ //throws Exception 오류나서 지웠음
		List<ReviewVO> reviewList = reviewDAO.selectAllReviewList();
		return reviewList;
	}
}
