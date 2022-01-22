package com.onlineshop.greysky.member.service;

import java.util.Map;

import com.onlineshop.greysky.member.vo.MemberVO;

public interface MemberService {

	MemberVO login(MemberVO memberVO) throws Exception;

}
