package com.borajoin.teuching.message.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;
import com.borajoin.teuching.message.model.service.MessageService;
import com.borajoin.teuching.message.model.vo.Message;

@Controller
public class MessageController {

	@Autowired
	MessageService ms;

	/**
	 * @Method Name : msgBoxSend
	 * @작성일 : 2020. 6. 12.
	 * @작성자 : 김지수
	 * @Method 설명 : 보낸 쪽지함 목록 띄우기---------------됨!!!
	 */
	@RequestMapping("/message/msgboxsend.do")
	public ModelAndView msgBoxSend(HttpSession session, Integer currentpage) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> res = new HashMap<String, Object>();
		String type = "";

		if (currentpage == null) {
			currentpage = 1;
		}

		if (session.getAttribute("memberType").equals("member")) {
			type = "Member";
			Member m = (Member) session.getAttribute("loginInfo");
			res = ms.selectMsgBoxSend(m.getMem_email(), currentpage, type);
		} else if (session.getAttribute("memberType").equals("trainer")) {
			type = "Trainer";
			Trainer t = (Trainer) session.getAttribute("loginInfo");
			res = ms.selectMsgBoxSend(t.getTr_email(), currentpage, type);
		}

		mv.addObject("res", res);
		mv.addObject("type", type);
		mv.setViewName("message/msgBoxSend");

		return mv;
	}

	/**
	 * @Method Name : msgBoxRecv
	 * @작성일 : 2020. 6. 12.
	 * @작성자 : 김지수
	 * @Method 설명 : 받은 쪽지 함 목록띄우기---------------됨!!!
	 */
	@RequestMapping("/message/msgboxrecv.do")
	public ModelAndView msgBoxRecv(HttpSession session, Integer currentpage) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> res = new HashMap<String, Object>();
		String type = "";
		if (currentpage == null)
			currentpage = 1;

		if (session.getAttribute("memberType").equals("trainer")) {
			type = "Trainer";
			Trainer t = (Trainer) session.getAttribute("loginInfo");
			res = ms.selectMsgBoxRecv(t.getTr_email(), currentpage, type);
		} else if (session.getAttribute("memberType").equals("member")) {
			type = "Member";
			Member m = (Member) session.getAttribute("loginInfo");
			res = ms.selectMsgBoxRecv(m.getMem_email(), currentpage, type);
		}
		mv.addObject("res", res);
		mv.addObject("type", type);
		mv.setViewName("message/msgBoxRecv");
		return mv;
	}

	/**
	 * @Method Name : msgRecvDetail
	 * @작성일 : 2020. 6. 12.
	 * @작성자 : 김지수
	 * @Method 설명 : 받은 메시지 자세히 보기---------------됨!!!
	 */
	@RequestMapping("/message/msgrecvdetail.do")
	public ModelAndView msgRecvDetail(HttpSession session, int message_idx) {
		ModelAndView mv = new ModelAndView();
		Message m = ms.selectMsgDetail(message_idx);
		Map<String, Object> commandMap = new HashMap<String, Object>();

		commandMap.put("tr_email", m.getTr_email());
		commandMap.put("mem_email", m.getMem_email());

		if (session.getAttribute("memberType").equals("trainer")) {
			mv.setViewName("message/msgRecvTra");
		} else if (session.getAttribute("memberType").equals("member")) {
			mv.setViewName("message/msgRecvMem");
		}

		mv.addObject("match", ms.showMatchInfo(commandMap));
		mv.addObject("res", m);

		return mv;
	}

	/**
	 * @Method Name : msgSendDetail
	 * @작성일 : 2020. 6. 12.
	 * @작성자 : 김지수
	 * @Method 설명 :보낸메시지 자세히 보기---------------됨!!!
	 */
	@RequestMapping("/message/msgsenddetail.do")
	public ModelAndView msgSendDetail(HttpSession session, int message_idx) {
		ModelAndView mv = new ModelAndView();
		Message m = ms.selectMsgDetail(message_idx);
		Map<String, Object> commandMap = new HashMap<String, Object>();

		commandMap.put("tr_email", m.getTr_email());
		commandMap.put("mem_email", m.getMem_email());

		if (session.getAttribute("memberType").equals("trainer")) {
			mv.setViewName("message/msgSendTra");
		} else if (session.getAttribute("memberType").equals("member")) {
			mv.setViewName("message/msgSendMem");
		}

		mv.addObject("match", ms.showMatchInfo(commandMap));
		mv.addObject("res", m);

		return mv;
	}

	/**
	 * @Method Name : msgAnsTra
	 * @작성일 : 2020. 6. 13.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너가 회원에게 보내는 답장---------------됨!!!
	 */
	@RequestMapping("/message/msganstra.do")
	public ModelAndView msgAnsTra(HttpSession session, String nick_name, String msg_cont, String mem_email) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> commandMap = new HashMap<String, Object>();
		Trainer t = (Trainer) session.getAttribute("loginInfo");

		commandMap.put("msg_cont", msg_cont);
		commandMap.put("mem_email", mem_email);
		commandMap.put("nick_name", nick_name);

		commandMap.put("tr_email", t.getTr_email());
		commandMap.put("trainer_name", t.getTrainerName());

		ms.insertMsgTra(commandMap);

		mv.addObject("msg", "발송이 완료 되었습니다");
		mv.setViewName("message/result");

		return mv;
	}

	/**
	 * @Method Name : matchForm
	 * @작성일 : 2020. 6. 10.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너에게 상담신청 폼으로 연결--------------됨!
	 */
	@RequestMapping("/message/matchform.do")
	public ModelAndView matchForm(String tr_email, String trainer_name, HttpSession session, String date, String year,
			String month) {
		ModelAndView mv = new ModelAndView();
		Member m = (Member) session.getAttribute("loginInfo");
		String year_month = month.replaceAll(" ", "");

		mv.addObject("tr_email", tr_email);
		mv.addObject("date", date);
		mv.addObject("year", year);
		mv.addObject("month", month);
		// ----------------------------------
		// mv.addObject("tr_email", tr_email);
		// ----------------------------------
		mv.setViewName("message/messageMatchForm");
		return mv;
	}

	/**
	 * @Method Name : matchFormSend
	 * @작성일 : 2020. 6. 10.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너에게 상담신청 메시지 발송 & 매칭 요청--------------됨!
	 */
	@RequestMapping("/message/matchformsend.do")
	public ModelAndView matchFormSend(String tr_email, String trainer_name, String msg_cont, Date match_date,
			String match_time, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> commandMap = new HashMap<String, Object>();

		Member m = (Member) session.getAttribute("loginInfo");
		commandMap.put("tr_email", tr_email);
		commandMap.put("trainer_name", ms.selectTraName(tr_email));
		System.out.println(tr_email);
		System.out.println(ms.selectTraName(tr_email));

		commandMap.put("mem_email", m.getMem_email());
		commandMap.put("nick_name", m.getNickname());

		commandMap.put("msg_cont", msg_cont);
		commandMap.put("match_date", match_date);
		commandMap.put("match_time", match_time);

		ms.insertMatchMessage(commandMap);
		ms.insertMatch(commandMap);

		mv.addObject("msg", "발송이 완료되었습니다");
		mv.setViewName("message/result");
		return mv;
	}

	/**
	 * @Method Name : MessageForm
	 * @작성일 : 2020. 6. 19.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너의 게시물에서 트레이너에게 메시지보내기 폼으로 연결----------됨!!!!
	 */
	@RequestMapping("/message/messageform.do")
	public ModelAndView messageForm(String tr_email, String trainer_name) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("tr_email", tr_email);
		mv.addObject("trainer_name", trainer_name);
		mv.setViewName("message/messageForm");
		return mv;
	}

	/**
	 * @Method Name : insertMessageForm
	 * @작성일 : 2020. 6. 19.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너의 프로필에서 메시지 보내기(매칭요청 없음)----------됨!!!!
	 */
	@RequestMapping("/message/messageformsend.do")
	public ModelAndView insertMessageForm(HttpSession session, String trainer_name, String tr_email, String msg_cont) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> commandMap = new HashMap<String, Object>();

		// 트레이너가 트레이너에게 메시지를 보내려 시도할경우 예외처리
		if (session.getAttribute("memberType").equals("trainer")) {
			mv.addObject("msg", "회원만 보낼 수 있습니다");
		} else if (session.getAttribute("memberType").equals("member")) {
			Member m = (Member) session.getAttribute("loginInfo");

			commandMap.put("tr_email", tr_email);
			commandMap.put("trainer_name", trainer_name);
			commandMap.put("mem_email", m.getMem_email());
			commandMap.put("nick_name", m.getNickname());
			commandMap.put("msg_cont", msg_cont);

			ms.insertMsgMem(commandMap);

			mv.addObject("msg", "메시지가 발송되었습니다");
		}
		mv.setViewName("message/result");
		return mv;
	}

	/**
	 * @Method Name : msgAccept
	 * @작성일 : 2020. 6. 13.
	 * @작성자 : 김지수
	 * @Method 설명 : 트레이너의 매칭 요청 수락 ajax처리-----------------됨!!!
	 */
	@ResponseBody
	@RequestMapping("/message/msgaccept.do")
	public String msgAccept(int match_idx) {
		String matchYn = "";
		if (ms.matchYnCheck(match_idx) > 0) {
			ms.updateMatchYn(match_idx);
			matchYn = "success";
		} else {
			matchYn = "fail";
		}
		return matchYn;
	}

	/**
	 * @Method Name : msgAnsMem
	 * @작성일 : 2020. 6. 13.
	 * @작성자 : 김지수
	 * @Method 설명 : 회원이 트레이너에게 보내는 답장-----------------됨!!!
	 */
	@RequestMapping("/message/msgansmem.do")
	public ModelAndView msgAnsMem(HttpSession session, String trainer_name, String tr_email, String msg_cont) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> commandMap = new HashMap<String, Object>();
		Member m = (Member) session.getAttribute("loginInfo");

		commandMap.put("mem_email", m.getMem_email());
		commandMap.put("nick_name", m.getNickname());
		commandMap.put("tr_email", tr_email);
		commandMap.put("trainer_name", trainer_name);
		commandMap.put("msg_cont", msg_cont);

		ms.insertMsgMem(commandMap);
		mv.addObject("msg", "발송이 완료되었습니다");
		mv.setViewName("message/result");
		return mv;
	}
}
