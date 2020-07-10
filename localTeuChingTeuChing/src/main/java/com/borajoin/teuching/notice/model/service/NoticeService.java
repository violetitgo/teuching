package com.borajoin.teuching.notice.model.service;

import java.util.List;
import java.util.Map;

import com.borajoin.teuching.notice.model.vo.Notice;

public interface NoticeService {
	public int noticeListCnt();
	public List<Notice> noticeList(Map<String, String> data);
	public Notice noticeDetail(int noticeIdx);
	public int deleteNotice(String noticeIdx);
	public int updateNotice(Notice notice);
	public int insertNotice(Notice notice);
}
