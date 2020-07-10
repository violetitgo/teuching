package com.borajoin.teuching.manager.model.vo;

import java.sql.Date;

public class TrainerReport {

	private int report_idx; // 신고번호
	private String tr_email; // 트레이너번호
	private String mem_email; // 회원번호
	private String rep_cont; // 신고내용
	private String report_handel; // 처리결과
	private String handel_cont; // 처리내용
	private Date report_date; // 신고일자
	private String ans_yn; // 답변여부
	private String nickname; // 신고 닉네임

	public TrainerReport() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getReport_idx() {
		return report_idx;
	}

	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
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

	public String getRep_cont() {
		return rep_cont;
	}

	public void setRep_cont(String rep_cont) {
		this.rep_cont = rep_cont;
	}

	public String getHandel_cont() {
		return handel_cont;
	}

	public void setHandel_cont(String handel_cont) {
		this.handel_cont = handel_cont;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public String getAns_yn() {
		return ans_yn;
	}

	public void setAns_yn(String ans_yn) {
		this.ans_yn = ans_yn;
	}

	public String getReport_handel() {
		return report_handel;
	}

	public void setReport_handel(String report_handel) {
		this.report_handel = report_handel;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "TrainerReport, report_idx=" + report_idx + ", tr_email=" + tr_email + ", mem_email=" + mem_email
				+ ", rep_cont=" + rep_cont + ", report_handel=" + report_handel + ", handel_cont=" + handel_cont
				+ ", report_date=" + report_date + ", ans_yn=" + ans_yn + ", nick_name=" + nickname;
	}

}
