package com.onlineshop.greysky.review.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;


public interface ReviewDAO {

	public List selectAllReviewList() throws DataAccessException;

}
