package com.onlineshop.greysky.member.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onlineshop.greysky.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView loadForm(@RequestParam(value="result", required=false) String result, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity join(@ModelAttribute("MemberVO")MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
