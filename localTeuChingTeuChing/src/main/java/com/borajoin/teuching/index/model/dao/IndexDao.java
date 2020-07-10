package com.borajoin.teuching.index.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.borajoin.teuching.member.model.vo.Trainer;

@Repository
public class IndexDao {
	@Autowired
	SqlSession sqlSession;
	
	public List<Trainer> topTrainers() {
		return sqlSession.selectList("Member.selectTopTrainer");
	}
}
