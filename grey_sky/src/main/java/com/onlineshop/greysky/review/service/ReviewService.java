package com.onlineshop.greysky.review.service;

import java.util.List;

import com.onlineshop.greysky.review.vo.ReviewVO;

public interface ReviewService {

	public List<ReviewVO> listReview() throws Exception;

}
