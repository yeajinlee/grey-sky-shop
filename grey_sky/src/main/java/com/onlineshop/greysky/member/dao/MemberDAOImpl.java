package com.onlineshop.greysky.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.onlineshop.greysky.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO login(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mappers.member.login", memberVO);
		return vo;
	}
	
	
}
