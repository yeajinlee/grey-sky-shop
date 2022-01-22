package com.onlineshop.greysky.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onlineshop.greysky.member.service.MemberService;
import com.onlineshop.greysky.member.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@RequestMapping(value = "/member/*Form.do", method = RequestMethod.GET)
	public ModelAndView loadForm(@RequestParam(value="result", required=false) String result ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;	
	}
	
	@Override
	@RequestMapping(value = "/member/login.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		if(memberVO != null && memberVO.getId() != null) {
			HttpSession session = request.getSession();
			session.setAttribute("logOn", true);
			session.setAttribute("memberInfo", memberVO);
			mav.setViewName("redirect:/main.do");
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("logOn");
		session.removeAttribute("memberInfo");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/join.do", method=RequestMethod.POST)
	public ResponseEntity join(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			memberService.join(memberVO);
			message = "<script>";
			message += "alert('환영합니다! 로그인창으로 이동합니다.');";
			message += "location.href='"+request.getContextPath()+"/member/loginForm.do';";
			message += "</script>";
		} catch(Exception e) {
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += "location.href='"+request.getContextPath()+"/member/joinForm.do';";
			message += "</script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="member/overlapped.do", method=RequestMethod.POST)
	public ResponseEntity overlapped(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	} 

}
