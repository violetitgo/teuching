package com.borajoin.teuching.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8565222011723910582L;
	private int review_idx;
	private String trainer_name;
	private String tr_email;
	private String mem_nickname;
	private String rev_cont;
	private String rev_score;
	private String rev_password;
	private String report_yn;
	private int recommend;
	private Date rev_date;
	private String tr_leave_yn;
	
	public Review() {
		
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public String getTrainer_name() {
		return trainer_name;
	}

	public void setTrainer_name(String trainer_name) {
		this.trainer_name = trainer_name;
	}

	public String getTr_email() {
		return tr_email;
	}

	public void setTr_email(String tr_email) {
		this.tr_email = tr_email;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getRev_cont() {
		return rev_cont;
	}

	public void setRev_cont(String rev_cont) {
		this.rev_cont = rev_cont;
	}


	public String getRev_score() {
		return rev_score;
	}

	public void setRev_score(String rev_score) {
		this.rev_score = rev_score;
	}

	public String getRev_password() {
		return rev_password;
	}

	public void setRev_password(String rev_password) {
		this.rev_password = rev_password;
	}

	public String getReport_yn() {
		return report_yn;
	}

	public void setReport_yn(String report_yn) {
		this.report_yn = report_yn;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public Date getRev_date() {
		return rev_date;
	}

	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	public String getTr_leave_yn() {
		return tr_leave_yn;
	}

	public void setTr_leave_yn(String tr_leave_yn) {
		this.tr_leave_yn = tr_leave_yn;
	}

	@Override
	public String toString() {
		return "Review [review_idx=" + review_idx + ", trainer_name=" + trainer_name + ", tr_email=" + tr_email
				+ ", mem_nickname=" + mem_nickname + ", rev_cont=" + rev_cont + ", rev_score=" + rev_score
				+ ", rev_password=" + rev_password + ", report_yn=" + report_yn + ", recommend=" + recommend
				+ ", rev_date=" + rev_date + ", tr_leave_yn=" + tr_leave_yn + "]";
	}

	
	
	
	
	
}
