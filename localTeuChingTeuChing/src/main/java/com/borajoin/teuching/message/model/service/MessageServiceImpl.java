package com.borajoin.teuching.message.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.search.StringTerm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.borajoin.teuching.message.model.dao.MessageDao;
import com.borajoin.teuching.message.model.vo.Match;
import com.borajoin.teuching.message.model.vo.Message;

import common.util.Paging;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao md;

	@Override
	public int insertMatchMessage(Map<String, Object> commandMap) {
		return md.insertMatchMessage(commandMap);
	}

	@Override
	public int insertMatch(Map<String, Object> commandMap) {
		return md.insertMatch(commandMap);
	}

	@Override
	public int selectSendMsgCnt(String type, String email) {
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("type", type);
		commandMap.put("email", email);
		return md.selectSendMsgCnt(commandMap);
	}

	@Override
	public int selectRecvMsgCnt(String type, String email) {
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("type", type);
		commandMap.put("email", email);
		return md.selectRecvMsgCnt(commandMap);
	}

	@Override
	public Map<String, Object> selectMsgBoxSend(String email, int currentpage, String type) {
		Map<String, Object> commandMap = new HashMap<String, Object>();
		Map<String, Object> res = new HashMap<String, Object>();
		Paging paging = new Paging(selectSendMsgCnt(type, email), currentpage, 5);

		commandMap.put("email", email);
		commandMap.put("paging", paging);
		commandMap.put("type", type);

		res.put("msg", md.selectMsgBoxSend(commandMap));
		res.put("paging", paging);

		return res;
	}

	@Override
	public Map<String, Object> selectMsgBoxRecv(String email, int currentpage, String type) {
		Map<String, Object> commandMap = new HashMap<String, Object>();
		Map<String, Object> res = new HashMap<String, Object>();
		Paging paging = new Paging(selectRecvMsgCnt(type, email), currentpage, 5);

		commandMap.put("email", email);
		commandMap.put("paging", paging);
		commandMap.put("type", type);

		res.put("msg", md.selectMsgBoxRecv(commandMap));
		res.put("paging", paging);

		return res;
	}

	@Override
	public Message selectMsgDetail(int message_idx) {
		return md.selectMsgDetail(message_idx);
	}

	@Override
	public int insertMsgTra(Map<String, Object> commandMap) {
		return md.insertMsgTra(commandMap);
	}

	//트레이너에의 받은 쪽지에 보여줄 매칭 정보
	@Override
	public List<Match> showMatchInfo(Map<String, Object> commandMap) {
		return md.showMatchInfo(commandMap);
	}

	//트레이너의 매칭 요청 수락
	@Override
	public int updateMatchYn(int match_idx) {
		return md.updateMatchYn(match_idx);
	}

	//트레이너의 매칭 요청 수락 시 , 매칭여부 확인용
	@Override
	public int matchYnCheck(int match_idx) {
		return md.matchYnCheck(match_idx);
	}

	//회원이 트레이너에게 보내는 답장
	@Override
	public int insertMsgMem(Map<String, Object> commandMap) {
		return md.insertMsgMem(commandMap);
	}

	@Override
	public String selectTraName(String tr_email) {
		return md.selectTraName(tr_email);
	}

	@Override
	public int insertManagerMessageToTra(Map<String, Object> commandMap) {
		return md.insertManagerMessageToTra(commandMap);
	}

	//리뷰삭제
	@Override
	public int deleteReview(int review_idx) {
		return md.deleteReview(review_idx);
	}

	@Override
	public int insertManagerMessageToMem(Map<String, Object> commandMap) {
		return md.insertManagerMessageToMem(commandMap);
	}

	@Override
	public String selectNickName(String mem_email) {
		return md.selectNickName(mem_email);
	}


	@Override
	public int selectReviewIdx(Map<String, Object> commandMap) {
		return md.selectReviewIdx(commandMap);
	}

}
