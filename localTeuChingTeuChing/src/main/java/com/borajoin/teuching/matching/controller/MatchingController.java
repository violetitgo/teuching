package com.borajoin.teuching.matching.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.borajoin.teuching.matching.model.service.MatchingService;
import com.borajoin.teuching.matching.model.vo.Post;
import com.borajoin.teuching.member.model.vo.Trainer;

@Controller
public class MatchingController {
	@Autowired
	MatchingService matchingService;
	
	/**
	* @Method Name : goin
	* @작성일 : 2020. 6. 1.
	* @작성자 : 이혜영
	* @Method 설명 : 매칭페이지로 넘어가는 메소드
	*/
	@RequestMapping("/matching/main.do")
	public ModelAndView goin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("matching/matching");
		return mav;
	}
	
	/**
	* @Method Name : searchWord
	* @작성일 : 2020. 6. 1.
	* @작성자 : 이혜영
	* @Method 설명 : 게시글 혹은 트레이너 검색 메소드
	*/
	@RequestMapping("/matching/searchword.do")
	@ResponseBody
	public List<Post> searchword(@RequestParam Map<String, String> data) {
		return matchingService.searchword(data);
	}
	
	/**
	* @Method Name : keyword
	* @작성일 : 2020. 6. 2.
	* @작성자 : 이혜영 
	* @Method 설명 : 키워드로 검색 메소드
	*/
	@RequestMapping("/matching/keyword.do")
	@ResponseBody
	public List<Post> keyword(@RequestParam Map<String, String> data) {
		return matchingService.keyword(data);
	}
}
