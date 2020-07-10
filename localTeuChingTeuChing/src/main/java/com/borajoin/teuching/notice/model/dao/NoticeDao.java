package com.borajoin.teuching.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.borajoin.teuching.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	@Autowired
	SqlSession sqlSession;
	
	public int noticeListCnt() {
		return sqlSession.selectOne("Notice.noticeListCnt");
	}
	
	public List<Notice> noticeList(Map<String, String> data) {
		return sqlSession.selectList("Notice.selectNotice", data);
	}
	
	public Notice noticeDetail(int noticeIdx) {
		return sqlSession.selectOne("Notice.noticeDetail", noticeIdx);
	}
	
	public int deleteNotice(String noticeIdx) {
		return sqlSession.delete("Notice.deleteNotice", noticeIdx);
	}
	
	public int updateNotice(Notice notice) {
		return sqlSession.update("Notice.updateNotice", notice);
	}
	
	public int insertNotice(Notice notice) {
		return sqlSession.insert("Notice.insertNotice", notice);
	}
}
