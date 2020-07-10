package com.borajoin.teuching.manager.model.vo;

public class Quali {
	private int quali_idx;
	private String quali_auth;
	private String tr_email;
	private String trainer_name;
	private String auth_yn;

	public Quali() {
		super();
	}

	public int getQuali_idx() {
		return quali_idx;
	}

	public void setQuali_idx(int quali_idx) {
		this.quali_idx = quali_idx;
	}

	public String getQuali_auth() {
		return quali_auth;
	}

	public void setQuali_auth(String quali_auth) {
		this.quali_auth = quali_auth;
	}

	public String getTr_email() {
		return tr_email;
	}

	public void setTr_email(String tr_email) {
		this.tr_email = tr_email;
	}

	public String getTrainer_name() {
		return trainer_name;
	}

	public void setTrainer_name(String trainer_name) {
		this.trainer_name = trainer_name;
	}

	public String getAuth_yn() {
		return auth_yn;
	}

	public void setAuth_yn(String auth_yn) {
		this.auth_yn = auth_yn;
	}

	@Override
	public String toString() {
		return "Quali [quali_idx=" + quali_idx + ", quali_auth=" + quali_auth + ", tr_email=" + tr_email
				+ ", trainer_name=" + trainer_name + ", auth_yn=" + auth_yn + "]";
	}

}
