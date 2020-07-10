package com.borajoin.teuching.review.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.borajoin.teuching.manager.model.vo.Quali;
import com.borajoin.teuching.matching.model.vo.Post;
import com.borajoin.teuching.member.model.vo.Trainer;
import com.borajoin.teuching.review.model.dao.ReviewDao;
import com.borajoin.teuching.review.model.vo.Review;
import com.sun.mail.auth.MD4;

import common.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao rd;

	@Override
	public Map<String, Object> selectReviewList(String orderby, int currentPage, int cntPerPage, String trainerEmail) {
		Map<String, Object> res = new HashMap<>();
		Paging page = new Paging(rd.contentCnt(trainerEmail), currentPage, cntPerPage);
		List<Review> rlist = rd.selectReviewList(page, orderby, trainerEmail);
		res.put("paging", page);
		res.put("rlist", rlist);
		return res;
	}

	@Override
	public int uploadReview(Review review) {
		int res = rd.uploadReview(review);
		return res;
	}

	@Override
	public int recUpdate(Map<String, Object> data) {
		int res = rd.recUpdate(data);
		// 추천수 업데이트 시키기
		if (res > 0) {
			int res2 = rd.insertreviewrrec(data);
			// reviewrec테이블에 데이터 넣기
		}
		return res;
	}

	@Override
	public int reviewrecyn(Map<String, Object> data) {
		int yn = rd.reviewrecyn(data);
		return yn;
	}


	@Override
	public int recCount(String no) {
		int res = rd.getLike(no);
		// 좋아요의 수 (업데이트된)
		return res;
	}

	

	// 해당하는 트레이너의 정보를 가져오는 메소드
	@Override
	public Map<String, Object> selectTrainerInformation(String trainerEmail) {
		Map<String, Object> res = new HashMap<>();
		List<Trainer> tlist = rd.selectTrainerInformation(trainerEmail);
		res.put("tlist", tlist);
		return res;
	}

	@Override
	public int deleteReview(Map<String, Object> data) {
		int res = rd.deleteReview(data);
		return 0;
	}

	@Override
	public Map<String, Object> selectPostList(String trainerEmail) {
		Map<String, Object> res = new HashMap<>();
		List<Post> plist = rd.selectPostList(trainerEmail);
		res.put("plist", plist);
		return res;
	}

	@Override
	public List<String> trainerquali(String trainerEmail) {
		return rd.trainerEmali(trainerEmail);
	}

	@Override
	public String trainerName(String tr_email) {
		String tlist = rd.trainerName(tr_email);

		return tlist;
	}
	
	
	@Override
	public int trrecUpdate(String trainerName) {
		int res = rd.trrecUpdate(trainerName);
		return res;
	}
	
	@Override
	public int TRLikeyn(Map<String, Object> data) {
		int res = rd.TRLikeyn(data);
		return res;
	}

	@Override
	public int TRLikeUpdate(Map<String, Object> data) {
		int res = rd.TRLikeUpdate(data);
		if(res > 0) {
			int res2 = rd.insertTRLikeInfo(data);
		}
		
		return res;
	}

	@Override
	public int trLikeCount(String email) {
		int res = rd.trLikeCount(email);
		return res;
	}

}
