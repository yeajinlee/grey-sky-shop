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
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.insert("mappers.member.insertNewMember", memberVO);
		
	}
	
	@Override
	public String selectOverlappedId(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mappers.member.selectOverlappedId", id);
		return result;
	}
	
	
}
