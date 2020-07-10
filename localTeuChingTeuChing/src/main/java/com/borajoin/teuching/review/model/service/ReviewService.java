package com.borajoin.teuching.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.borajoin.teuching.member.model.vo.Trainer;
import com.borajoin.teuching.review.model.vo.Review;


public interface ReviewService {

	
	public Map<String,Object> selectReviewList(String orderby, int currentPage, int cntPerPage, String trainerEmail);
	public int uploadReview(Review review);
	public int recUpdate(Map<String, Object> data);
	public int reviewrecyn(Map<String, Object> data);
	public int recCount(String no);	
	public int deleteReview(Map<String, Object> data);
	public Map<String,Object> selectTrainerInformation(String trainerEmail);
	public Map<String,Object> selectPostList(String trainerEmail);
	public List<String> trainerquali(String trainerEmail);
	public String trainerName(String tr_email);
	public int trrecUpdate(String trainerName);
	public int TRLikeyn(Map<String, Object> data);
	public int TRLikeUpdate(Map<String,Object> data);
	public int trLikeCount(String email);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
