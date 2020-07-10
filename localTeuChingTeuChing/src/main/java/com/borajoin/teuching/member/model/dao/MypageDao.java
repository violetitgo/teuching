package com.borajoin.teuching.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.borajoin.teuching.matching.model.vo.Post;
import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;

@Repository
public class MypageDao {

	@Autowired
	private SqlSessionTemplate session;
	
	// 일반회원 세션 새로 가져오기용
	public Member m_login(Map<String, Object> commandMap) {
		return session.selectOne("Mypage.m_newlogin", commandMap);
	}

	// 트레이너 세션 새로 가져오기용
	public Trainer t_login(Map<String, Object> commandMap) {
		return session.selectOne("Mypage.t_newlogin", commandMap);
	}
	
	// 일반회원 회원정보 업데이트
	public int update_mypage_M(Map<String, Object> commandMap){
		return session.update("Mypage.update_mypage_M", commandMap);
	}
	
	// 트레이너 회원정보 업데이트
	public int update_mypage_T(Map<String, Object> commandMap){
		return session.update("Mypage.update_mypage_T", commandMap);
	}
	
	// 일반회원 탈퇴
	public int m_out(Map<String, Object> commandMap) {
		return session.update("Mypage.m_out", commandMap);
	}

	// 트레이너 탈퇴
	public int t_out(Map<String, Object> commandMap) {
		return session.update("Mypage.t_out", commandMap);
	}
	
	//트레이너 게시글 리스트
	public List<Post> t_postlist(Map<String, String> data) {
		return session.selectList("Member.t_postlist", data);
	}
	//개시글 개수
	public int t_count(Trainer t) {
		return session.selectOne("Member.t_count", t);
	}
	
	
	
	
	
	
	
	
	
	
	
}
