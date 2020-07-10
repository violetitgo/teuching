package com.borajoin.teuching.message.model.service;

import java.util.List;
import java.util.Map;

import com.borajoin.teuching.message.model.vo.Match;
import com.borajoin.teuching.message.model.vo.Message;

public interface MessageService {
	public int insertMatchMessage(Map<String, Object> commandMap);

	public int insertMatch(Map<String, Object> commandMap);
	
	public int selectSendMsgCnt(String type, String email);
	
	public int selectRecvMsgCnt(String type, String email);
	
	public Map<String, Object> selectMsgBoxSend(String email, int currentpage, String type);
	
	public Map<String, Object> selectMsgBoxRecv(String email, int currentpage, String type);
	
	public Message selectMsgDetail(int message_idx);
	
	public int insertMsgTra(Map<String, Object> commandMap);
	
	public List<Match> showMatchInfo(Map<String, Object> commandMap);
	
	public int updateMatchYn(int match_idx);
	
	public int matchYnCheck(int match_idx);
	
	public int insertMsgMem(Map<String, Object> commandMap);
	
	public String selectTraName(String tr_email);
	
	public int insertManagerMessageToTra(Map<String, Object> commandMap);
	
	public int insertManagerMessageToMem(Map<String, Object> commandMap);
	
	public int deleteReview(int review_idx);
	
	public String selectNickName(String mem_email);
	
	public int selectReviewIdx(Map<String, Object> commandMap);
}
