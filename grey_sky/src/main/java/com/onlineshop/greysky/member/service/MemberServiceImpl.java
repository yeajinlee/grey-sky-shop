package com.onlineshop.greysky.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onlineshop.greysky.member.dao.MemberDAO;
import com.onlineshop.greysky.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return memberDAO.login(memberVO);
	}
	
	@Override
	public void join(MemberVO memberVO) throws Exception{
		memberDAO.insertNewMember(memberVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception {
		return memberDAO.selectOverlappedId(id);
	}
	
}
