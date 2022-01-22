package com.onlineshop.greysky.member.service;


import com.onlineshop.greysky.member.vo.MemberVO;

public interface MemberService {

	MemberVO login(MemberVO memberVO) throws Exception;

	void join(MemberVO memberVO) throws Exception;
	
	String overlapped(String id) throws Exception;
	

}
