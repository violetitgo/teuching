package com.borajoin.teuching.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.NStringTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.borajoin.teuching.manager.model.service.ManagerService;
import com.borajoin.teuching.manager.model.vo.Quali;
import com.borajoin.teuching.manager.model.vo.ReviewReport;
import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;
import com.borajoin.teuching.message.model.service.MessageService;

import common.util.File_Upload;

@Controller
public class ManagerController {

	@Autowired
	ManagerService ms;
	@Autowired
	MessageService msgs;

	/**
	 * @Method Name : managerPage
	 * @작성일 : 2020. 6. 1.
	 * @작성자 : 김지수
	 * @Method 설명 : 관리자 페이지 내 트레이너 신고 ---------------ㅇㅋ
	 */
	@RequestMapping("/manager/report.do")
	public ModelAndView managerPage(Integer tracurrentpage) {

		ModelAndView mv = new ModelAndView();
		Map<String, Object> res = new HashMap<String, Object>();

		if (tracurrentpage == null) {
			tracurrentpage = 1;
		}

		res.put("resTra", ms.selectTraReport(tracurrentpage));

		mv.addObject("res", res);
		mv.setViewName("manager/manager");

		return mv;
	}

	/**
	 * @Method Name : reviewReport
	 * @작성일 : 2020. 6. 21.
	 * @작성자 : 김지수
	 * @Method 설명 : 관리자 페이지 중 리뷰신고 페이지 구현------------ㅇㅋ
	 */
	@RequestMapping("/manager/reviewreport.do")
	public ModelAndView reviewReport(Integer revcurrentpage) {

		ModelAndView mv = new ModelAndView();
		Map<String, Object> res = new HashMap<String, Object>();

		if (revcurrentpage == null) {
			revcurrentpage = 1;
		}

		res.put("resRev", ms.selectRevReport(revcurrentpage));

		mv.addObject("res", res);
		mv.setViewName("manager/reviewReport");

		return mv;
	}

	/**
	 * @Method Name : managerDetailAnswer
	 * @작성일 : 2020. 6. 6.
	 * @작성자 : 김지수
	 * @Method 설명 : 신고 게시글에 대한 처리 결과 작성 페이지 매핑------------ㅇㅋ
	 */
	@PostMapping("/manager/reportdetail/ans.do")
	public ModelAndView managerDetailAnswer(@RequestParam Map<String, Object> commandMap) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("res", commandMap);
		mv.setViewName("manager/managerAnswer");
		return mv;
	}

	/**
	 * @Method Name : managerDetailModify
	 * @작성일 : 2020. 6. 6.
	 * @작성자 : 김지수
	 * @Method 설명 : 신고 게시글에 대한 처리 결과 작성 및 수정------------ㅇㅋ
	 */
	@PostMapping("/manager/reportdetail/modify.do")
	public ModelAndView managerDetailModify(@RequestParam Map<String, Object> commandMap) {
		ModelAndView mv = new ModelAndView();
		if (commandMap.get("type").equals("tra")) {
			ms.updateManagerDetail_tra(commandMap);
			mv.setViewName("redirect:/teuching/manager/reportdetail.do?traid=" + commandMap.get("report_idx"));
		}
		if (commandMap.get("type").equals("rev")) {
			ms.updateManagerDetail_rev(commandMap);
			mv.setViewName("redirect:/teuching/manager/reportdetail.do?revid=" + commandMap.get("report_idx"));
		}
		return mv;
	}

	/**
	 * @Method Name : reportView
	 * @작성일 : 2020. 6. 6.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너 신고 및 리뷰신고 작성 페이지 매핑------------ㅇㅋ
	 */
	@RequestMapping("/report/reportrequest.do")
	public ModelAndView reportView(@RequestParam Map<String, Object> commandMap, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 멤버일 경우
		if (session.getAttribute("memberType").equals("member")) {
			Member m = (Member) session.getAttribute("loginInfo");

			commandMap.put("mem_email", m.getMem_email());
			commandMap.put("nick_name", m.getNickname());
			// 트레이너일 경우
		} else if (session.getAttribute("memberType").equals("trainer")) {
			Trainer t = (Trainer) session.getAttribute("loginInfo");
			String mem_email = ms.selectTremailForReviewDelete((String) commandMap.get("nick_name"));

			commandMap.put("tr_email", t.getTr_email());
			commandMap.put("trainer_name", t.getTrainerName());
			commandMap.put("mem_email", mem_email);
		}
		mv.addObject("res", commandMap);
		mv.setViewName("manager/writeReport");
		return mv;
	}

	/**
	 * @Method Name : reportFileUpload
	 * @작성일 : 2020. 6. 6.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너 신고 및 리뷰신고 작성 & 파일 업로드------------ㅇㅋ
	 */
	@PostMapping("/report/insertreport.do")
	public ModelAndView reportFileUpload(@RequestParam Map<String, Object> commandMap, List<MultipartFile> files,
			HttpServletRequest request, HttpSession session) {

		ModelAndView mv = new ModelAndView();
		List<File_Upload> fileData = new ArrayList<File_Upload>();
		int[] res = ms.insertReport(commandMap);
		String root = session.getServletContext().getRealPath("/");
		String mappingPage = "";
		if (session.getAttribute("memberType").equals("member")) {
			mappingPage = "review";
		} else if (session.getAttribute("memberType").equals("trainer")) {
			mappingPage = "reviewforTR";
		}

		for (MultipartFile mf : files) {
			UUID uuid = UUID.randomUUID();
			if (mf.getSize() > 0) {
				String savepath = root + "resources/upload/";
				String type = "";
				String origin_filename = mf.getOriginalFilename();
				File_Upload file = new File_Upload();
				if (session.getAttribute("memberType").equals("member")) {
					file.setTable_idx(res[0]);
					type = "TraReport";
				}
				if (session.getAttribute("memberType").equals("trainer")) {
					file.setTable_idx(res[0]);
					type = "RevReport";
				}
				String rename_filename = uuid + "_" + type
						+ origin_filename.substring(origin_filename.lastIndexOf("."));
				savepath += rename_filename;

				file.setOrigin_filename(origin_filename);
				file.setRename_filename(rename_filename);
				file.setSavepath(savepath);
				file.setObj(mf);
				fileData.add(file);
			}
		}
		ms.insertFile(fileData);
		mv.addObject("url", "/teuching/profile/" + mappingPage + ".do?trainerEmail="
				+ commandMap.get("tr_email"));
		mv.addObject("msg", "신고 완료 되었습니다");
		mv.setViewName("common/result");
		return mv;
	}

	/**
	 * @Method Name : selectQuali
	 * @작성일 : 2020. 6. 6.
	 * @작성자 : 김지수
	 * @Method 설명 : 관리자 페이지의 자격증명 메뉴 구현------------ㅇㅋ
	 */
	@RequestMapping("/manager/quali.do")
	public ModelAndView selectQuali(Integer currentpage) {
		ModelAndView mv = new ModelAndView();
		if (currentpage == null) {
			currentpage = 1;
		}
		mv.addObject("res", ms.selectQuali(currentpage));
		mv.setViewName("manager/quali");
		return mv;
	}

	/**
	 * @Method Name : selectQualiDetail
	 * @작성일 : 2020. 6. 6.
	 * @작성자 : 김지수
	 * @Method 설명 : 자격증명 요청글의 상세 내용 확인-------------ㅇㅋ
	 */
	@RequestMapping("/manager/qualidetail.do")
	public ModelAndView selectQualiDetail(String qualiidx) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manager/qualiDetail");
		mv.addObject("res", ms.selectQualiDetail(qualiidx));
		mv.addObject("file", ms.selectQualiFile(qualiidx));
		mv.addObject("trainer", ms.selectTrainerforQuali(qualiidx));
		return mv;
	}

	/**
	 * @Method Name : updateQualiYn
	 * @작성일 : 2020. 6. 6.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너 인증 요청 승인처리-------------ㅇㅋ
	 */
	@RequestMapping("/manager/qualidetail/auth.do")
	public ModelAndView updateQualiYn(int quali_idx, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		ms.updateQualiYn(quali_idx);
		mv.addObject("msg", "승인 완료 되었습니다");
		mv.addObject("url", "/teuching/manager/quali.do");
		mv.setViewName("common/result");
		return mv;
	}

	/**
	 * @Method Name : qualiRequest
	 * @작성일 : 2020. 6. 12.
	 * @작성자 : 김지수
	 * @Method 설명 : 자격증명 요청페이지로 이동-------ㅇㅋ
	 */
	@RequestMapping("/quali/qualirequest.do")
	public ModelAndView qualiRequest() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manager/qualiRequest");
		return mv;
	}

	/**
	 * @Method Name : insertQuali
	 * @작성일 : 2020. 6. 18.
	 * @작성자 : 김지수
	 * @Method 설명 : 자격 증명 요청 페이지--------ㅇㅋ
	 */
	@RequestMapping("/quali/insertquali.do")
	public ModelAndView insertQuali(MultipartFile qualiFile, HttpServletRequest request, String quali_auth) {
		ModelAndView mv = new ModelAndView();
		Trainer t = (Trainer) request.getSession().getAttribute("loginInfo");
		String root = request.getSession().getServletContext().getRealPath("/");
		UUID uuid = UUID.randomUUID();
		
		if (qualiFile.getSize() > 0) {
		String origin_filename = qualiFile.getOriginalFilename();
		String rename_filename = uuid + "tr_quali" + origin_filename.substring(origin_filename.lastIndexOf("."));
		String savepath = root + "resources/" + rename_filename;
			File_Upload file_Upload = new File_Upload();
			file_Upload.setOrigin_filename(origin_filename);
			file_Upload.setRename_filename(rename_filename);
			file_Upload.setSavepath(savepath);
			file_Upload.setTable_idx(ms.selectQualiIdx());
			file_Upload.setObj(qualiFile);
			ms.insertQualiFile(file_Upload);
		}

		Quali quali = new Quali();
		quali.setQuali_auth(quali_auth);
		quali.setTr_email(t.getTr_email());
		quali.setTrainer_name(t.getTrainerName());
		ms.insertQuali(quali);

		mv.addObject("msg", "요청이 완료되었습니다");
		mv.addObject("url", "/teuching/member/mypaget.do");
		mv.setViewName("common/result");
		return mv;
	}

	// 테스트
	@RequestMapping("/report/mypagerev.do")
	public ModelAndView selectRevReportMypage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member m = (Member) session.getAttribute("loginInfo");
		mv.addObject("report", ms.selectTraReportMypage(m.getMem_email()));
		mv.setViewName("manager/test");
		return mv;
	}

	/**
	 * @Method Name : selectRevReportMypage
	 * @작성일 : 2020. 6. 18.
	 * @작성자 : 김지수
	 * @Method 설명 : 회원의 마이페이지 내 신고내역
	 */
	@RequestMapping("/report/mypagereport.do")
	public ModelAndView selectRevReportMypage(Integer traid, Integer revid) {
		ModelAndView mv = new ModelAndView();
		if (traid != null) {
			mv.addObject("res", ms.traManagerDetail(traid));
			mv.addObject("file", ms.selectTraFile(traid));
		} else if (revid != null) {
			mv.addObject("res", ms.revManagerDetail(revid));
			mv.addObject("file", ms.selectRevFile(revid));
		}
		mv.setViewName("manager/reportdetail_M");
		return mv;
	}

	/**
	 * @Method Name : trainerBlack
	 * @작성일 : 2020. 6. 21.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너 신고에대한 매니저의 경고 처리------------ㅇㅋ
	 */
	@RequestMapping("/report/trainerblack.do")
	public ModelAndView trainerBlack(String tr_email) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> commandMap = new HashMap<String, Object>();

		commandMap.put("tr_email", tr_email);
		commandMap.put("trainer_name", msgs.selectTraName(tr_email));

		ms.updateBlackYn(tr_email);
		msgs.insertManagerMessageToTra(commandMap);

		mv.addObject("msg", "경고 처리가 완료되었습니다.");
		mv.addObject("back", "back");
		mv.setViewName("common/result");
		return mv;
	}

	/**
	 * @Method Name : deleteReview
	 * @작성일 : 2020. 6. 20.
	 * @작성자 : 김지수
	 * @Method 설명 : 리뷰신고에 의한 해당리뷰 삭제와 해당 닉네임의 회원에게 경고메시지 전송---------ㅇㅋ
	 */
	@RequestMapping("/report/deleteReview")
	public ModelAndView deleteReview(@RequestParam Map<String, Object> commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String mem_email = (String) commandMap.get("mem_email");
		// 닉네임 - 가져옴
		commandMap.put("nick_name", msgs.selectNickName(mem_email));

		int check = ms.checkForReviewDelete(commandMap);
		// 예외처리해야함
		if (check > 0) {
			int review_idx = msgs.selectReviewIdx(commandMap);
			msgs.deleteReview(review_idx);
			msgs.insertManagerMessageToMem(commandMap);

			mv.addObject("msg", "해당 리뷰 삭제 처리되었습니다");
		} else {
			mv.addObject("msg", "이미 처리 완료된 신고 입니다");
		}
		mv.addObject("back", "back");
		mv.setViewName("common/result");

		return mv;
	}

	/**
	 * @Method Name : managerDetail
	 * @작성일 : 2020. 6. 6.
	 * @작성자 : 김지수
	 * @Method 설명 : 신고 게시글에 대한 상세페이지---------------ㅇㅋ
	 */
	@RequestMapping("/manager/reportdetail.do")
	public ModelAndView managerDetail(Integer revid, Integer traid) {
		ModelAndView mv = new ModelAndView();
		List<File_Upload> fu = new ArrayList<File_Upload>();
		if (revid == null) {
			mv.addObject("type", "tra");
			mv.addObject("res", ms.traManagerDetail(traid));
			fu = ms.selectTraFile(traid);
		}
		if (traid == null) {
			mv.addObject("type", "rev");
			mv.addObject("res", ms.revManagerDetail(revid));
			fu = ms.selectRevFile(revid);
		}
		mv.addObject("file", fu);
		mv.setViewName("manager/managerDetail");
		return mv;
	}

}
