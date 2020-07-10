package com.borajoin.teuching.member.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.borajoin.teuching.index.controller.IndexController;
import com.borajoin.teuching.index.model.service.IndexService;
import com.borajoin.teuching.member.model.service.MemberService;
import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	
	/**
	* @Method Name : loginModal
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : Modal창 띄우기 테스트중..
	*/
	@GetMapping("/loginmodal")
	public String loginModal() {
		return "/loginmodal";
	}

	
	/**
	* @Method Name : login
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 로그인 페이지로 이동
	*/
	@RequestMapping("/member/login.do")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/loginform");

		return mav;
	}

	/**
	* @Method Name : find_pw_form
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 비밀번호 찾기 폼으로 이동
	*/
	@RequestMapping("/member/findpwform.do")
	public ModelAndView find_pw_form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/findpwform");

		return mav;
	}

	/**
	* @Method Name : loginImple
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 로그인 하기
	*/
	@RequestMapping("/member/loginimple.do")
	@ResponseBody
	public ModelAndView loginImple(@RequestParam Map<String, Object> commandMap, HttpSession session)
			throws SQLException {
		ModelAndView mav = new ModelAndView();
		if (commandMap.get("account").equals("member")) {
			Member res = ms.m_login(commandMap);

			if (res == null) {
				mav.addObject("msg", "이메일 혹은 비밀번호를 확인해주세요.");
				mav.addObject("url", "account/loginform");
				mav.setViewName("account/redirect");

			} else {

				if (res.getLeave_yn().equals("Y")) {
					mav.addObject("msg", "회원 탈퇴가 완료된 계정입니다.");
					mav.addObject("url", "account/loginform");
					mav.setViewName("account/redirect");
				} else {
					
					if (res.getManager_yn().equals("Y")) {
						session.setAttribute("loginInfo", res);
						session.setAttribute("memberType", "manager");
						mav.setViewName("redirect:/teuching/index/index.do");
					} else {
						session.setAttribute("loginInfo", res);
						session.setAttribute("memberType", "member");
						mav.setViewName("redirect:/teuching/index/index.do");
					}

				}
			}	
		} else {
			Trainer res = ms.t_login(commandMap);

			if (res == null) {
				mav.addObject("msg", "이메일 혹은 비밀번호를 확인해주세요.");
				mav.addObject("url", "account/loginform");
				mav.setViewName("account/redirect");
			} else {
				
				if (res.getLeave_yn().equals("Y")) {
					mav.addObject("msg", "회원 탈퇴가 완료된 계정입니다.");
					mav.addObject("url", "account/loginform");
					mav.setViewName("account/redirect");
				} else {
					session.setAttribute("loginInfo", res);
					session.setAttribute("memberType", "trainer");
					mav.setViewName("redirect:/teuching/index/index.do");
				}
			}
		}
		return mav;
	}

	/**
	* @Method Name : logout
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 로그아웃
	*/
	@RequestMapping("/member/logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (session != null) {
			session.removeAttribute("loginInfo");
		}

		mav.setViewName("redirect:/teuching/index/index.do");
		
		return mav;
	}

	/**
	* @Method Name : join
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 회원가입 페이지로 이동
	*/
	@RequestMapping("/member/join.do")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/memberjoin");

		return mav;
	}

	/**
	* @Method Name : mjoin
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 일반회원 회원가입 폼으로 이동
	*/
	@RequestMapping("/member/mjoin.do")
	public ModelAndView mjoin(String data) {
		ModelAndView mav = new ModelAndView();
		if (data.equals("member")) {
			mav.setViewName("account/joinformm");
		} else {
			mav.setViewName("account/joinformt");
		}

		return mav;
	}

	/**
	* @Method Name : joinMemberImple
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 일반 회원 회원가입
	*/
	@RequestMapping("/member/joinmemberimple.do")
	public ModelAndView joinMemberImple(@RequestParam Map<String, Object> commandMap) throws SQLException {
		ModelAndView mav = new ModelAndView();
		int res = ms.joinMember(commandMap);
		if (res < 1) {
			mav.addObject("msg", "회원가입에 실패하였습니다.");
			mav.addObject("url", "account/loginform");
			mav.setViewName("account/redirect");
		} else {
			mav.setViewName("redirect:/teuching/index/index.do");
		}
		return mav;
	}

	/**
	* @Method Name : joinTrainerImple
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 트레이너 회원가입
	*/
	@RequestMapping("/member/jointrainerimple.do")
	public ModelAndView joinTrainerImple(@RequestParam Map<String, Object> commandMap) throws SQLException {
		ModelAndView mav = new ModelAndView();
		int res = ms.joinTrainer(commandMap);
		if (res < 1) {
			mav.addObject("msg", "회원가입에 실패하였습니다.");
			mav.addObject("url", "account/loginform");
			mav.setViewName("account/redirect");
		} else {
			mav.setViewName("redirect:/teuching/index/index.do");
		}
		return mav;
	}
	
	/**
	* @Method Name : m_joinEmailCheck
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 일반회원 회원가입 이메일 발송 
	*/
	@RequestMapping("/member/mjoinemailCheck.do")
	public ModelAndView m_joinEmailCheck(@RequestParam Map<String, Object> commandMap)
			throws SQLException {
		ModelAndView mav = new ModelAndView();
		String mailfor ="m_join";
		String path = "/teuching/index/index.do";

		commandMap.put("urlPath", path);
		ms.mailSending(commandMap,mailfor);

		mav.setViewName("redirect:/teuching/index/index.do");

		return mav;
	}

	/**
	* @Method Name : t_joinEmailCheck
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 트레이너 회원가입 이메일 발송 + 파일 넣기
	*/
	@RequestMapping("/member/tjoinemailcheck.do")
	public ModelAndView t_joinEmailCheck(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, MultipartHttpServletRequest mtf)
			throws SQLException {
		String root = request.getSession().getServletContext().getRealPath("/");
		ModelAndView mav = new ModelAndView();
		// 파일 태그
		String fileTag = "file";
	    // 업로드 파일이 저장될 경로
		String filePath = root + "resources/upload/profileImg/";
		// 파일 이름	
		MultipartFile file = mtf.getFile(fileTag);
		String filetype = StringUtils.getFilenameExtension(file.getOriginalFilename());
		String fileName = (String)commandMap.get("email") +"."+filetype;
		// 파일 전송
		try {
		    file.transferTo(new File(filePath + fileName));
		} catch(Exception e) {
		    System.out.println("파일 업로드 오류");
		}
		commandMap.put("photo", fileName);
		
		String preMap1 = (String)commandMap.get("prefer1-1")+" "+(String)commandMap.get("prefer1-2");
		String preMap2 = (String)commandMap.get("prefer2-1")+" "+(String)commandMap.get("prefer2-2");
		String preMap3 = (String)commandMap.get("prefer3-1")+" "+(String)commandMap.get("prefer3-2");
		
		commandMap.put("prefer1", preMap1);
		commandMap.put("prefer2", preMap2);
		commandMap.put("prefer3", preMap3);
		
		String keyword = (String)commandMap.get("keyword1");
		
		if ((String) commandMap.get("keyword2") != "") {
			keyword = (String) commandMap.get("keyword1") + "," + (String) commandMap.get("keyword2");
			if ((String) commandMap.get("keyword3") != "") {
				keyword = (String) commandMap.get("keyword1") + "," + (String) commandMap.get("keyword2") + ","
						+ (String) commandMap.get("keyword3");
				if ((String) commandMap.get("keyword4") != "") {
					keyword = (String) commandMap.get("keyword1") + "," + (String) commandMap.get("keyword2") + ","
							+ (String) commandMap.get("keyword3") + "," + (String) commandMap.get("keyword4");
					if ((String) commandMap.get("keyword5") != "") {
						keyword = (String) commandMap.get("keyword1") + "," + (String) commandMap.get("keyword2") + ","
								+ (String) commandMap.get("keyword3") + "," + (String) commandMap.get("keyword4") + ","
								+ (String) commandMap.get("keyword5");
					}
				}
			}
		}
		
		commandMap.put("keyword", keyword);
		
		String mailfor ="t_join";
		String path = "/teuching/index/index.do";

		commandMap.put("urlPath", path);
		ms.mailSending(commandMap,mailfor);

		mav.setViewName("redirect:/teuching/index/index.do");

		return mav;
	}

	/**
	* @Method Name : nickChk
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 일반회원 - 닉네임 중복체크
	*/
	@RequestMapping(value = "/member/nickchk.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String nickChk(HttpServletRequest request) throws SQLException {
		String nickname = request.getParameter("nickname");
		int result = ms.nickChk(nickname);
		return Integer.toString(result);
	}

	/**
	* @Method Name : emailChk
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 두분류 회원 이메일 중복체크
	*/
	@RequestMapping(value = "/member/emailchk.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String emailChk(@RequestParam Map<String, Object> data) throws SQLException {
		data.put("table", "TR_MEMBER"); 

		int result = ms.emailChk(data); 

		if (result < 1) { 
			data.put("table", "TR_TRAINER"); 
			result = ms.emailChk(data); 
		}

		return Integer.toString(result);
	}

	/**
	* @Method Name : findpw
	* @작성일 : 2020. 6. 14.
	* @작성자 : 이남규 
	* @Method 설명 : 비밀번호 찾기 (비밀번호 변경 + 임시 비밀번호 메일전송)
	*/
	@RequestMapping("/member/findpw.do")
	public ModelAndView findpw(@RequestParam Map<String, Object> commandMap, HttpServletRequest request)
			throws SQLException {
		ModelAndView mav = new ModelAndView();
		String path = "/teuching/index/index.do";
		String mailfor = "";
		String pw = "";		//랜덤 임시 비밀번호 생성
		
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		
		commandMap.put("table", "TR_MEMBER");  //비교 테이블 값 넣기
		int result = ms.emailChk(commandMap);	// 테이블 조회
		commandMap.put("password", pw);	// 임시 비밀번호 담기
		
		if (result == 0) {
			// 트레이너 비밀번호 변경 및 메일전송
			commandMap.put("table", "TR_TRAINER");
			ms.change_pw(commandMap);
			mailfor = "t_findpw";
			commandMap.put("urlPath", path); 
			ms.mailSending(commandMap, mailfor);
		} else {
			// 일반회원 비밀번호 변경 및 메일전송
			ms.change_pw(commandMap);
			mailfor = "m_findpw";
			commandMap.put("urlPath", path); 
			ms.mailSending(commandMap, mailfor);
		}
		mav.setViewName("redirect:/teuching/index/index.do");
		return mav;
	}
}