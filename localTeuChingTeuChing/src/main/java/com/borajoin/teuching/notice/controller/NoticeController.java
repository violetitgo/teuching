package com.borajoin.teuching.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.borajoin.teuching.matching.model.vo.Post;
import com.borajoin.teuching.notice.model.service.NoticeService;
import com.borajoin.teuching.notice.model.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	/**
	* @Method Name : noticeList
	* @작성일 : 2020. 6. 10.
	* @작성자 : 이혜영 
	* @Method 설명 : 공지사항 게시판으로 이동하는 메소드
	*/
	@RequestMapping("/notice/notice.do")
	public ModelAndView noticeList(@RequestParam Map<String, String> data) {
		ModelAndView mav = new ModelAndView();
		List<Notice> nList = noticeService.noticeList(data);
		
		mav.addObject("size", noticeService.noticeListCnt());
		mav.addObject("page", data);
		mav.addObject("nList", nList);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	/**
	* @Method Name : noticeDetail
	* @작성일 : 2020. 6. 12.
	* @작성자 : 이혜영 
	* @Method 설명 : 공지사항 상세페이지로 이동하는 메소드
	*/
	@RequestMapping("/notice/detail.do")
	public ModelAndView noticeDetail(int noticeIdx) {
		ModelAndView mav = new ModelAndView();
		Notice notice = noticeService.noticeDetail(noticeIdx);
		if(notice != null) {
			mav.addObject("notice", notice);
		}
		mav.setViewName("notice/noticeDetail");
		return mav;
	}
	
	/**
	* @Method Name : writePage
	* @작성일 : 2020. 6. 12.
	* @작성자 : 이혜영 
	* @Method 설명 : 게시글 작성 페이지로 이동하는 메소드
	*/
	@RequestMapping("/notice/write.do")
	public ModelAndView writePage(int noticeIdx) {
		ModelAndView mav = new ModelAndView();
		if(noticeIdx > 0) {
			Notice notice = noticeService.noticeDetail(noticeIdx);
			mav.addObject("notice", notice);
		}
		mav.setViewName("notice/writeNotice");
		return mav;
	}
	
	/**
	* @Method Name : deleteNotice
	* @작성일 : 2020. 6. 12.
	* @작성자 : 이혜영 
	* @Method 설명 : 공지사항 삭제 메소드
	*/
	@RequestMapping("/notice/delete.do")
	public ModelAndView deleteNotice(String noticeIdx) {
		ModelAndView mav = new ModelAndView();
		int res = noticeService.deleteNotice(noticeIdx);
		mav.setViewName("redirect:/teuching/notice/notice.do?start=0&end=5");
		return mav;
	}
	
	/**
	* @Method Name : write
	* @작성일 : 2020. 6. 12.
	* @작성자 : 이혜영 
	* @Method 설명 : 공지사항 추가 or 변경하는 메소드
	*/
	@RequestMapping("/notice/writeNotice.do")
	public ModelAndView write(Notice notice) {
		ModelAndView mav = new ModelAndView();
		int res = 0;
		if(notice.getNoticeIdx() > 0 ) {
			res = updateNotice(notice);
		} else {
			res = insertNotice(notice);
		}
		
		mav.setViewName("redirect:/teuching/notice/notice.do?start=0&end=5");
		return mav;
	}
	
	/**
	* @Method Name : updateNotice
	* @작성일 : 2020. 6. 12.
	* @작성자 : 이혜영 
	* @Method 설명 : 공지사항 변경 메소드 write 메소드에서 호출
	*/
	public int updateNotice(Notice notice) {
		return noticeService.updateNotice(notice);
	}
	
	/**
	* @Method Name : insertNotice
	* @작성일 : 2020. 6. 12.
	* @작성자 : 이혜영 
	* @Method 설명 : 공지사항 추가 메소드 write 메소드에서 호출
	*/
	public int insertNotice(Notice notice) {
		return noticeService.insertNotice(notice);
	}
}
