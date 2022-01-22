package com.onlineshop.greysky.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ReviewController {

	public ModelAndView listReview(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
