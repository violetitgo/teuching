package com.borajoin.teuching.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.borajoin.teuching.notice.model.dao.NoticeDao;
import com.borajoin.teuching.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public int noticeListCnt() {
		return noticeDao.noticeListCnt();
	}

	@Override
	public List<Notice> noticeList(Map<String, String> data) {
		return noticeDao.noticeList(data);
	}

	@Override
	public Notice noticeDetail(int noticeIdx) {
		return noticeDao.noticeDetail(noticeIdx);
	}

	@Override
	public int deleteNotice(String noticeIdx) {
		return noticeDao.deleteNotice(noticeIdx);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}
}
