package com.borajoin.teuching.review.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.borajoin.teuching.manager.model.vo.Quali;
import com.borajoin.teuching.matching.model.vo.Post;
import com.borajoin.teuching.member.model.vo.Trainer;
import com.borajoin.teuching.review.model.vo.Review;

import common.util.Paging;

@Repository
public class ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int contentCnt(String trainerEmail) {

		// 게시글 갯수를 반환해줄 메서드

		return sqlSession.selectOne("Review.contentCnt",trainerEmail );
	}

	public List<Review> selectReviewList(Paging page, String orderby,String trainerEmail) {
		Map<String, Object> data = new HashMap<>();
		data.put("page", page);
		data.put("orderby", orderby);
		data.put("trainerEmail",trainerEmail);
		return sqlSession.selectList("Review.selectReviewList", data);

	}
	
	// 리뷰업로드
	public int uploadReview(Review review) {
		
		return sqlSession.insert("Review.uploadReview",review);
	}
	
	// 리뷰삭제
	public int deleteReview(Map<String,Object> data) {
		return sqlSession.update("Review.deleteReview",data);
	}
	
	
	// 추천 
	public int recUpdate(Map<String, Object> data) {
		return sqlSession.update("Review.recUpdate", data);
	}
	
	// 추천 (트레이너 테이블 tr_like)
		public int trrecUpdate(String trainerName) {
			return sqlSession.update("Review.trrecUpdate", trainerName);
		}
	
	
	// reviewrec테이블에 데이터 추가
	public int insertreviewrrec(Map<String, Object> data) {
		return sqlSession.insert("Review.insertreviewrrec", data);
	}
	
	
	
	// 추천수 가져오기
	public int getLike(String no) {
		return sqlSession.selectOne("Review.getLike",no);
	}
	
	
	
	// 추천여부
	public int reviewrecyn(Map<String, Object> data) {
		return sqlSession.selectOne("Review.reviewrecyn", data);
	}
	
	
	// review_rec테이블에 데이터 제거
	public int recRealDelete(Map<String, Object> data) {
	
		return sqlSession.delete("Review.recRealDelete", data);
	}
	
	// 트레이너 정보 가져오기
	public  List<Trainer> selectTrainerInformation(String trainerEmail) {
		return sqlSession.selectList("Review.selectTrainerInformation", trainerEmail);
	}
	
	// 포스트 리스트 가져오기
	public List<Post> selectPostList(String trainerEmail){
		return sqlSession.selectList("Review.selectPostList", trainerEmail);
	}
	
	public List<String> trainerEmali(String trainerEmail){
		return sqlSession.selectList("Review.trainerquali", trainerEmail);
	}
	
	// 트레이너 네임 가져오기 위한 메소드
	public String trainerName(String tr_email) {
		return sqlSession.selectOne("Review.trainername", tr_email);
	}
	
	public int TRLikeyn(Map<String, Object> data) {
		return sqlSession.selectOne("Review.TRLikeyn", data);
	}
	
	public int TRLikeUpdate(Map<String, Object> data) {
		return sqlSession.update("Review.TRLikeUpdate",data);
	}
	
	public int insertTRLikeInfo(Map<String,Object> data) {
		return sqlSession.insert("Review.insertTRLikeInfo",data);
	}
	
	public int trLikeCount(String email) {
		return sqlSession.selectOne("Review.trLikeCount",email);
	}
}
