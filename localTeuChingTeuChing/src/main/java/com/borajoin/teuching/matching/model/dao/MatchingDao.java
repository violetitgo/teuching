package com.borajoin.teuching.matching.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.borajoin.teuching.matching.model.vo.Post;

@Repository
public class MatchingDao {
	@Autowired
	SqlSession sqlSession;
	
	public List<Post> searchword(Map<String, String> data) {
		return sqlSession.selectList("Matching.searchWord", data);
	}
	
	public List<Post> keyword(Map<String, String> data) {
		return sqlSession.selectList("Matching.keyword", data);
	}
}
