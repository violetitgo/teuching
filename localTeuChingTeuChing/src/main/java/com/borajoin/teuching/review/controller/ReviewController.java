package com.borajoin.teuching.review.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.borajoin.teuching.review.model.service.ReviewService;
import com.borajoin.teuching.review.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService rs;

	/**
	 * @Method Name : reviewList
	 * @작성일 : 2020. 6. 8.
	 * @작성자 : 이보라
	 * @Method 설명 : 리뷰리스트 리뷰페이지에다가 뿌려주는 메소드임
	 */
	
	@RequestMapping("profile/reviewforTR.do")
	public ModelAndView reviewListforTR(@RequestParam Map<String, Object> commandMap) {

		ModelAndView mav = new ModelAndView();

		int currentPage = 1;
		int cntPerPage = 5;
		String trainerEmail = (String) commandMap.get("trainerEmail");

		String orderby = "review_idx"; // 기준으로 orderby할 것 가져오기

		
		if (commandMap.get("reviewPage") != null) {
			currentPage = Integer.parseInt((String) commandMap.get("reviewPage"));
		}

		if (commandMap.get("cntPerPage") != null) {
			cntPerPage = Integer.parseInt((String) commandMap.get("cntPerPage"));
		}
		
		 if (commandMap.get("trainerEmail") != null) { 
			 System.out.println("이보라 (ReviewController) -"+"가져온 트레이너 이메일 : " + trainerEmail);
		}
		 
		 

		Map<String, Object> res = rs.selectReviewList(orderby, currentPage, cntPerPage,trainerEmail );
		
		Map<String, Object> trainerInfo = rs.selectTrainerInformation(trainerEmail);
		System.out.println("이보라 (ReviewController) -"+"트레이너의 정보 " +trainerInfo );
		
		Map<String,Object> postList = rs.selectPostList(trainerEmail);
		mav.addObject("postList",postList);
		mav.addObject("trainerInfo", trainerInfo);
		mav.addObject("reviewList", res);
		mav.addObject("quali",rs.trainerquali(trainerEmail));
		mav.setViewName("profile/reviewforTR");

		return mav;

	}
	
	
	@RequestMapping("profile/review.do")
	public ModelAndView reviewList(@RequestParam Map<String, Object> commandMap) {

		ModelAndView mav = new ModelAndView();

		int currentPage = 1;
		int cntPerPage = 5;
		String trainerEmail = (String) commandMap.get("trainerEmail");

		String orderby = "review_idx"; // 기준으로 orderby할 것 가져오기

		
		if (commandMap.get("reviewPage") != null) {
			currentPage = Integer.parseInt((String) commandMap.get("reviewPage"));
		}

		if (commandMap.get("cntPerPage") != null) {
			cntPerPage = Integer.parseInt((String) commandMap.get("cntPerPage"));
		}
		
		 if (commandMap.get("trainerEmail") != null) { 
			 System.out.println("이보라 (ReviewController) -"+"가져온 트레이너 이메일 : " + trainerEmail);
		}
		 
		 

		Map<String, Object> res = rs.selectReviewList(orderby, currentPage, cntPerPage,trainerEmail );
		
		Map<String, Object> trainerInfo = rs.selectTrainerInformation(trainerEmail);
		System.out.println("이보라 (ReviewController) -"+"트레이너의 정보 " +trainerInfo );
		
		Map<String,Object> postList = rs.selectPostList(trainerEmail);
		mav.addObject("postList",postList);
		mav.addObject("trainerInfo", trainerInfo);
		mav.addObject("reviewList", res);
		mav.addObject("quali",rs.trainerquali(trainerEmail));
		mav.setViewName("profile/review");

		return mav;

	}
	
	

	// 리뷰 업로드
	@RequestMapping("review/uploadreview.do")
	@ResponseBody
	public int uploadReview(Review review, @RequestParam Map<String, Object> data) {
		
		String trainerName = rs.trainerName((String)data.get("tr_email"));
		System.out.println("이보라 (ReviewController) -"+"가져온 트레이너 이름 : " + trainerName);
		
		
		review.setTrainer_name(trainerName);
		review.setTr_email((String)data.get("tr_email"));
		review.setMem_nickname((String) data.get("memNickname"));
		review.setRev_password((String) data.get("reviewPw"));
		review.setRev_score((String) data.get("rev_score"));
		review.setRev_cont((String) data.get("revCont"));
		
		
		
		int res = rs.uploadReview(review);
		
		
		
		
		return res;
	}
	
	@RequestMapping("review/deletereview.do")
	@ResponseBody
	public int deleteReview(@RequestParam Map<String, Object> data) {
		int res = rs.deleteReview(data);
		return res;
	}

	/**
	 * @Method Name : scheduledo
	 * @작성일 : 2020. 6. 8.
	 * @작성자 : 이보라
	 * @Method 설명 : 스케줄러로 이동한다ㅋ
	 */
	@RequestMapping("profile/schedule.do")
	public ModelAndView scheduledo(String tr_email) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("profile/schedule");
		mav.addObject("tr_email", tr_email);
		//mav.setViewName("profile/test");
		return mav;
	}

	/**
	 * @Method Name : recUpdate
	 * @작성일 : 2020. 6. 10.
	 * @작성자 : 이보라
	 * @Method 설명 : 추천수 업데이트
	 */
	@RequestMapping(value = "review/recupdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int recUpdate(@RequestParam Map<String, Object> data) {
		int res = 0;
		int real = 0;
		int result = rs.reviewrecyn(data);
		if (result == 0) {
			// 추천을 한적 없다면 추천 추가
			res = rs.recUpdate(data);
			
			real = 0;
		} else {
			// 추천 한적 있으면 암것도 하지마
			real = 1;
			
		}
		return real;
	}
	
	@RequestMapping(value="review/trlikeupdate.do")
	@ResponseBody
	public int trLike(@RequestParam Map<String, Object> data) {
		int res = 0;
		int real = 0;
		int result = rs.TRLikeyn(data);
		System.out.println("이보라 (ReviewController-trLike) -"+"가져온 트레이너 이메일 : " + data.get("tremail"));
		if (result == 0) {
			// 좋아요를 한적 없다면 추천 추가
			res = rs.TRLikeUpdate(data);			
			real = 0;
		} else {
			// 좋아요  한적 있으면 암것도 하지마
			real = 1;
			
		}
		return real;
	}
	

	@RequestMapping(value = "review/trlikecount.do", method = RequestMethod.POST)
	@ResponseBody
	public int trLikeCount(@RequestParam Map<String, Object> data) {
		// 트레이너 좋아요 구함
		int count = rs.trLikeCount((String)data.get("tremail"));
		return count;
	}

	@RequestMapping(value = "review/reccount.do", method = RequestMethod.POST)
	@ResponseBody
	public int recCount(@RequestParam Map<String, Object> data) {
		// 추천수 구함
		int count = rs.recCount((String)data.get("no"));
		return count;
	}
	
	

}
