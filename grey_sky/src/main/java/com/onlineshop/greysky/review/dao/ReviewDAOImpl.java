package com.onlineshop.greysky.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.onlineshop.greysky.review.vo.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List selectAllReviewList() throws DataAccessException{
		List reviewList = sqlSession.selectList("mappers.review.selectAllReviewList");
		return reviewList;
	}

}
