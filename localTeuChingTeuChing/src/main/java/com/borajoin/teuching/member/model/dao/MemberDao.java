package com.borajoin.teuching.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate session;
	
	//일반 회원 회원가입
	public int joinMember(Map<String,Object> commandMap) {
		return session.insert("Member.joinMember", commandMap);
	}

	// 트레이너 회원가입
	public int joinTrainer(Map<String,Object> commandMap) {
		return session.insert("Member.joinTrainer", commandMap);
	}
	
	
	//일반회원 닉네임 중복확인
	public int nickChk(String nickname) {
		int res = session.selectOne("Member.nickChk", nickname);
		return res;
	}
	
	//회원가입 이메일 중복체크 Dao
	public int emailChk(Map<String,Object> data) {
		return session.selectOne("Member.emailChk", data);
	}
	
	//로그인
	public Member m_login(Map<String, Object> commandMap) {
		
		return session.selectOne("Member.m_login", commandMap);
	}
	
	//트레이너 로그인
	public Trainer t_login(Map<String, Object> commandMap) {
		
		return session.selectOne("Member.t_login", commandMap);
	}
	
	// 비밀번호 변경하기
	public int update_pw(Map<String, Object> commandMap) {
		return session.update("Member.update_pw", commandMap);
	}
	
	


	

	
	
	
	
	
	
	
	
}
