package com.borajoin.teuching.member.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.borajoin.teuching.matching.model.vo.Post;
import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;

public interface MypageService {

	// 트레이너 게시글 데이터 가져오기
	public List<Post> t_postlist(Map<String, String> data);
	// 트레이너 게시글 개수 가져오기
	public int t_count(Trainer t);

	// 트레이너 정보 업데이트
	public Trainer update_mypage_T(Map<String, Object> commandMap) throws Exception;

	// 일반회원 정보 업데이트
	public Member update_mypage_M(Map<String, Object> commandMap) throws Exception;

	// 일반회원 탈퇴
	public int m_out(Map<String, Object> commandMap) throws SQLException;

	// 트레이너 탈퇴
	public int t_out(Map<String, Object> commandMap) throws SQLException;
	
	public Trainer t_login(Map<String, Object> commandMap) throws Exception;
	public Member m_login(Map<String, Object> commandMap) throws Exception;

	
	
}
