package com.borajoin.teuching.member.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;

public interface MemberService {

	//일반회원 회원가입
	public int joinMember(Map<String, Object> commandMap) throws SQLException;
	//트레이너 회원가입
	public int joinTrainer(Map<String, Object> commandMap) throws SQLException;
	
	//일반회원 닉네임 체크
	 public int nickChk(String nickname) throws SQLException;
	 
	//이메일 체크 Service
	 public int emailChk(Map<String, Object> data) throws SQLException;
	
	 //일반회원 로그인
	 public Member m_login(Map<String, Object> commandMap) throws SQLException;
	 
	 //트레이너 로그인
	 public Trainer t_login(Map<String, Object> commandMap) throws SQLException;
	 
	//합쳐진 메일관련
	 public void mailSending(Map<String, Object> commandMap, String mailfor) throws SQLException;
	 
	 //패스워드 변경
	 public int change_pw(Map<String, Object> commandMap) throws SQLException;
	 
	 
	 
	
	
	
	
	
}
