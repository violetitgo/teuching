package com.borajoin.teuching.notice.model.vo;

public class Notice {
	private int noticeIdx;
	private String noticeTitle;
	private String noticeCont;
	private String writeDate;

	public Notice() {
		super();
	}

	public Notice(int noticeIdx, String noticeTitle, String noticeCont, String writeDate) {
		super();
		this.noticeIdx = noticeIdx;
		this.noticeTitle = noticeTitle;
		this.noticeCont = noticeCont;
		this.writeDate = writeDate;
	}

	public int getNoticeIdx() {
		return noticeIdx;
	}

	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeCont() {
		return noticeCont;
	}

	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "Notice [noticeIdx=" + noticeIdx + ", noticeTitle=" + noticeTitle + ", noticeCont=" + noticeCont
				+ ", writeDate=" + writeDate + "]";
	}
}
