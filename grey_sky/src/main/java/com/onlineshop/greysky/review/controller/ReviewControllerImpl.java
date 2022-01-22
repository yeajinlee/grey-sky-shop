package com.onlineshop.greysky.review.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.onlineshop.greysky.common.interceptor.ViewNameInterceptor;
import com.onlineshop.greysky.review.service.ReviewService;
import com.onlineshop.greysky.review.vo.ReviewVO;


@Controller("reviewController")
public class ReviewControllerImpl implements ReviewController{
	private static final String CURR_IMAGE_REPO_PATH = "C:\\greysky\\review_image";
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReviewVO reviewVO;
//	@Autowired
//	private ViewNameInterceptor viewNameInterceptor;
	
	@Override
	@RequestMapping(value="/review/listReview.do", method= RequestMethod.GET)
	public ModelAndView listReview (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List reviewList = reviewService.listReview();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reviewList", reviewList);
		return mav;                                                                                                                                                                                                                                                                                                                          
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
