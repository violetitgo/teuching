package com.borajoin.teuching.message.model.vo;

import java.sql.Date;

public class Match {
	private int match_idx;
	private String tr_email;
	private String mem_email;
	private Date match_date;
	private String match_time;
	private String match_yn;

	public Match() {
		super();
	}

	public int getMatch_idx() {
		return match_idx;
	}

	public void setMatch_idx(int match_idx) {
		this.match_idx = match_idx;
	}

	public String getTr_email() {
		return tr_email;
	}

	public void setTr_email(String tr_email) {
		this.tr_email = tr_email;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public Date getMatch_date() {
		return match_date;
	}

	public void setMatch_date(Date match_date) {
		this.match_date = match_date;
	}

	public String getMatch_time() {
		return match_time;
	}

	public void setMatch_time(String match_time) {
		this.match_time = match_time;
	}

	public String getMatch_yn() {
		return match_yn;
	}

	public void setMatch_yn(String match_yn) {
		this.match_yn = match_yn;
	}

	@Override
	public String toString() {
		return "Match [match_idx=" + match_idx + ", tr_email=" + tr_email + ", mem_email=" + mem_email + ", match_date="
				+ match_date + ", match_time=" + match_time + ", match_yn=" + match_yn + "]";
	}

}
