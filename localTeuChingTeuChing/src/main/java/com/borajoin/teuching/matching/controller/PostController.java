package com.borajoin.teuching.matching.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.borajoin.teuching.matching.model.service.PostService;
import com.borajoin.teuching.matching.model.vo.Post;
import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;

import common.util.File_Upload;

@Controller
public class PostController {

	@Autowired
	PostService postService;
	
	/**
	* @Method Name : postDetail
	* @작성일 : 2020. 6. 3.
	* @작성자 : 이혜영 
	* @Method 설명 : 상세페이지로 이동하는 메소드
	*/
	@RequestMapping("/post/detail.do")
	public ModelAndView postDetail(int postNo) {
		ModelAndView mav = new ModelAndView();
		Post data = new Post();
		data.setPostIdx(postNo);
		Map<String, Object> resMap = postService.postDetail(data);
		
		mav.addObject("data", resMap);
		mav.setViewName("post/postDetail");
		return mav;
	}
	
	/**
	* @Method Name : writePost
	* @작성일 : 2020. 6. 3.
	* @작성자 : 이혜영 
	* @Method 설명 : 게시글 쓰기 페이지로 이동하는 메소드
	*/
	@RequestMapping("/post/writepost.do")
	public ModelAndView writePost(int postIdx) {
		ModelAndView mav = new ModelAndView();
		if(postIdx > 0) {
			Post post = new Post();
			post.setPostIdx(postIdx);
			Map<String, Object> resMap = postService.postDetail(post);
			mav.addObject("data", resMap);
		}
		mav.setViewName("post/writePost");
		return mav;
	}
	
	/**
	* @Method Name : write
	* @작성일 : 2020. 6. 5.
	* @작성자 : 이혜영 
	* @Method 설명 : 게시글 업로드 메소드
	*/
	@RequestMapping("/post/write.do")
	public ModelAndView write(@RequestParam List<MultipartFile> images, Post post, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<File_Upload> fileData = new ArrayList<>();
		String root = session.getServletContext().getRealPath("/");
		int i = 0;
		
		for(MultipartFile mf : images) {
			if(!mf.getOriginalFilename().equals("")) {
				File_Upload upload = new File_Upload();
				String savePath = root + "resources/upload/";
				String originFileName = mf.getOriginalFilename();
					
				UUID uuid = UUID.randomUUID();
				String renameFileName = uuid + "_post" + originFileName.substring(originFileName.lastIndexOf("."));
				savePath += renameFileName;
				System.out.println("<<<<< : " + savePath);
				upload.setOrigin_filename(originFileName);
				upload.setRename_filename(renameFileName);
				upload.setSavepath(savePath);
				upload.setObj(mf);
					
				fileData.add(upload);
				i++;
			}
		}
		
		if(post.getPostIdx() > 0) {
			edit(post, fileData);
		} else {
			Trainer trainer = (Trainer) session.getAttribute("loginInfo");
			post.setTrEmail(trainer.getTr_email());
			post.setSports(trainer.getPurpose_keyword());
			post.setArea(trainer.getAddress());
			post.setGender(trainer.getGender());
			post.setTrainerName(trainer.getTrainerName());
			
			int res = postService.insertPost(post, fileData);
		}
		
		mav.setViewName("redirect:/teuching/matching/main.do");
		return mav;
	}
	
	/**
	* @Method Name : edit
	* @작성일 : 2020. 6. 6.
	* @작성자 : 이혜영 
	* @Method 설명 : 게시글 수정 메소드
	*/
	@RequestMapping("/post/editpost.do")
	public ModelAndView edit(Post post, List<File_Upload> fileData) {
		ModelAndView mav = new ModelAndView();
		for (File_Upload file : fileData) {
			file.setTable_idx(post.getPostIdx());
		}
		int res = postService.updatePost(post, fileData);
		mav.setViewName("redirect:/teuching/matching/main.do");
		return mav;
	}
	
	/**
	* @Method Name : delete
	* @작성일 : 2020. 6. 11.
	* @작성자 : 이혜영 
	* @Method 설명 : 게시글 삭제 메소드
	*/
	@RequestMapping("/post/deletepost.do")
	public ModelAndView delete(String postIdx) {
		ModelAndView mav = new ModelAndView();
		int res = postService.deletePost(postIdx);
		mav.setViewName("matching/matching");
		return mav;
	}
}
