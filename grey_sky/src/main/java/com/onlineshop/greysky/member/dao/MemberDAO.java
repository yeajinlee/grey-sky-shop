package com.onlineshop.greysky.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.onlineshop.greysky.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(MemberVO memberVO) throws DataAccessException;

	public void insertNewMember(MemberVO memberVO) throws DataAccessException;

	public String selectOverlappedId(String id) throws DataAccessException;
	
}
