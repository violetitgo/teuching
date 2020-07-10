package com.borajoin.teuching.member.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.borajoin.teuching.manager.model.service.ManagerService;
import com.borajoin.teuching.matching.model.vo.Post;
import com.borajoin.teuching.member.model.service.MemberService;
import com.borajoin.teuching.member.model.service.MypageService;
import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;

@Controller
public class MypageController {

	@Autowired
	private MypageService mys;
	@Autowired
	private ManagerService managers;
	@Autowired
	private MemberService ms;

	/**
	 * @Method Name : mypageM
	 * @작성일 : 2020. 6. 17.
	 * @작성자 : 이남규
	 * @Method 설명 : 마이 페이지로 이동
	 */
	@RequestMapping("/member/mypagem.do")
	public ModelAndView mypageM(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("일반회원 마이페이지");
		Member m = (Member) session.getAttribute("loginInfo");

		mav.addObject("match", managers.selectMemMatchMypage(m.getMem_email()));
		mav.addObject("report", managers.selectTraReportMypage(m.getMem_email()));

		mav.setViewName("account/mypagem");
		return mav;
	}

	/**
	 * @Method Name : mypageT
	 * @작성일 : 2020. 6. 17.
	 * @작성자 : 이남규
	 * @Method 설명 : 트레이너 마이페이지 이동
	 */
	@RequestMapping("/member/mypaget.do")
	public ModelAndView mypageT(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("트레이너 마이페이지");
		Trainer t = (Trainer) session.getAttribute("loginInfo");

		// 자격증명, 리뷰신고, 매칭내역
		mav.addObject("report", managers.selectRevReportMypage(t.getTr_email()));
		mav.addObject("quali", managers.selectTraQualiMypage(t.getTr_email()));
		mav.addObject("match", managers.selectTraMatchMypage(t.getTr_email()));

		mav.addObject("postCount", mys.t_count(t));

		mav.setViewName("account/mypaget");
		return mav;
	}

	/**
	 * @Method Name : goodbye
	 * @작성일 : 2020. 6. 20.
	 * @작성자 : 이남규
	 * @Method 설명 : 회원 탈퇴 페이지로 이동
	 */
	@RequestMapping("/member/goodbye.do")
	public ModelAndView goodbye(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("회원탈퇴 페이지");

		mav.setViewName("account/goodbyeform");
		return mav;
	}

	/**
	 * @Method Name : goodbyeUpdate
	 * @작성일 : 2020. 6. 20.
	 * @작성자 : 이남규
	 * @Method 설명 : 회원탈퇴하기
	 */
	@RequestMapping("/member/goodbyeupdate.do")
	public ModelAndView goodbyeUpdate(@RequestParam Map<String, Object> commandMap, HttpSession session)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		System.out.println(commandMap);

		int res = 0;

		if (commandMap.get("account").equals("member")) {
			res = mys.m_out(commandMap);

			if (res == 0) {
				mav.addObject("msg", "비밀번호를 확인해주세요.");
				mav.addObject("url", "account/goodbyeform");
				mav.setViewName("account/redirect");

			} else {
				session.removeAttribute("loginInfo");
				mav.addObject("msg", "회원 탈퇴가 완료되었습니다. 감사합니다.");
				mav.setViewName("account/tomain");
			}

		} else {
			res = mys.t_out(commandMap);

			if (res == 0) {
				mav.addObject("msg", "비밀번호를 확인해주세요.");
				mav.addObject("url", "account/goodbyeform");
				mav.setViewName("account/redirect");
			} else {
				session.removeAttribute("loginInfo");
				mav.addObject("msg", "회원 탈퇴가 완료되었습니다. 감사합니다.");
				mav.setViewName("account/tomain");
			}
		}

		return mav;
	}

	/**
	 * @throws Exception
	 * @Method Name : mypageUpdate_M
	 * @작성일 : 2020. 6. 17.
	 * @작성자 : 이남규
	 * @Method 설명 : 일반회원 마이페이지 정보 업데이트
	 */
	@RequestMapping("/member/mypageupdatem.do")
	public ModelAndView mypageUpdate_M(@RequestParam Map<String, Object> commandMap, HttpSession session)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		System.out.println(commandMap);

		Member res = mys.update_mypage_M(commandMap);
		session.setAttribute("loginInfo", res);

		mav.setViewName("account/mypagem");

		return mav;
	}

	@RequestMapping("/member/pwupdate.do")
	public ModelAndView pwUpdate(@RequestParam Map<String, Object> commandMap, HttpSession session)
			throws SQLException {

		// 들어오는거... 이메일 주소 , 새로운 비밀번호, 계정정보(memberType)
		ModelAndView mav = new ModelAndView();

		if (commandMap.get("memberType").equals("trainer")) {
			// 트레이너 비밀번호 변경
			commandMap.put("table", "TR_TRAINER");
			ms.change_pw(commandMap);
			session.removeAttribute("loginInfo");
			mav.addObject("msg", "비밀번호가 변경되었습니다. 다시 로그인해 주세요.");
			mav.setViewName("account/tomain");
		} else {
			// 일반회원 비밀번호 변경
			commandMap.put("table", "TR_MEMBER");
			ms.change_pw(commandMap);
			session.removeAttribute("loginInfo");
			mav.addObject("msg", "비밀번호가 변경되었습니다. 다시 로그인해 주세요.");
			mav.setViewName("account/tomain");
		}

		return mav;
	}

	/**
	 * @Method Name : mypageUpdate_T
	 * @작성일 : 2020. 6. 17.
	 * @작성자 : 이남규
	 * @Method 설명 : 트레이너 마이페이지 정보 업데이트
	 */
	@RequestMapping("/member/mypageupdatet.do")
	public ModelAndView mypageUpdate_T(@RequestParam Map<String, Object> commandMap,
			@SessionAttribute("loginInfo") Trainer t, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		System.out.println(commandMap);
		String preMap1;
		String preMap2;
		String preMap3;

		if ((String) commandMap.get("prefer1-1") == null || (String) commandMap.get("prefer1-2") == null) {
			preMap1 = t.getPrefer_add1();
		} else {
			preMap1 = (String) commandMap.get("prefer1-1") + " " + (String) commandMap.get("prefer1-2");
		}
		if ((String) commandMap.get("prefer2-1") == null || (String) commandMap.get("prefer2-2") == null) {
			preMap2 = t.getPrefer_add2();
		} else {
			preMap2 = (String) commandMap.get("prefer2-1") + " " + (String) commandMap.get("prefer2-2");
		}
		if ((String) commandMap.get("prefer3-1") == null || (String) commandMap.get("prefer3-2") == null) {
			preMap3 = t.getPrefer_add3();
		} else {
			preMap3 = (String) commandMap.get("prefer3-1") + " " + (String) commandMap.get("prefer3-2");
		}

		String keyword = t.getPurpose_keyword();
		if ((String) commandMap.get("keyword1") != "") {
			keyword = (String) commandMap.get("keyword1");
			if ((String) commandMap.get("keyword2") != "") {
				keyword = (String) commandMap.get("keyword1") + "," + (String) commandMap.get("keyword2");
				if ((String) commandMap.get("keyword3") != "") {
					keyword = (String) commandMap.get("keyword1") + "," + (String) commandMap.get("keyword2") + ","
							+ (String) commandMap.get("keyword3");
					if ((String) commandMap.get("keyword4") != "") {
						keyword = (String) commandMap.get("keyword1") + "," + (String) commandMap.get("keyword2") + ","
								+ (String) commandMap.get("keyword3") + "," + (String) commandMap.get("keyword4");
						if ((String) commandMap.get("keyword5") != "") {
							keyword = (String) commandMap.get("keyword1") + "," + (String) commandMap.get("keyword2")
									+ "," + (String) commandMap.get("keyword3") + ","
									+ (String) commandMap.get("keyword4") + "," + (String) commandMap.get("keyword5");
						}
					}
				}
			}
		}
		commandMap.put("prefer1", preMap1);
		commandMap.put("prefer2", preMap2);
		commandMap.put("prefer3", preMap3);
		commandMap.put("keyword", keyword);
		System.out.println(commandMap);

		Trainer res = mys.update_mypage_T(commandMap);
		session.setAttribute("loginInfo", res);

		mav.setViewName("account/mypaget");

		return mav;
	}

	/**
	 * @Method Name : t_postlist
	 * @작성일 : 2020. 6. 18.
	 * @작성자 : 이남규
	 * @Method 설명 : 트레이너 마이페이지 게시글 목록 불러오기
	 */
	@RequestMapping("/member/tpostlist.do")
	@ResponseBody
	public List<Post> t_postlist(@RequestParam Map<String, String> data) {
		return mys.t_postlist(data);
	}

	/**
	 * @Method Name : photoUpdate
	 * @작성일 : 2020. 6. 18.
	 * @작성자 : 이남규
	 * @Method 설명 : 사진 업데이트하기
	 */
	@RequestMapping("/member/photoupdate.do")
	@ResponseBody
	public int photoUpdate(@RequestParam MultipartFile file, HttpSession session) throws SQLException {
		int res = 0;
		// 업로드 파일이 저장될 경로
		String root = session.getServletContext().getRealPath("/");
		String filePath = root + "resources/upload/profileImg/";
		String fileName = ((Trainer) session.getAttribute("loginInfo")).getTr_email() + ".PNG";

		// 파일 전송
		try {
			file.transferTo(new File(filePath + fileName));
			res = 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			res = 0;
		}

		return res;
	}

}
