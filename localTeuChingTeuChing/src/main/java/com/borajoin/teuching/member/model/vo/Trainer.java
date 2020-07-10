package com.borajoin.teuching.member.model.vo;

public class Trainer {
	private String tr_email;
	private String password;
	private String trainerName;
	private String gender;
	private int weight;
	private int height;
	private String cell;
	private String career;
	private String address;
	private String address_detail;
	private String prefer_add1;
	private String prefer_add2;
	private String prefer_add3;
	private String photo;
	private int tr_like;
	private String black_yn;
	private String leave_yn;
	private String purpose_keyword;
	
	
	public String getTr_email() {
		return tr_email;
	}
	public void setTr_email(String tr_email) {
		this.tr_email = tr_email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getTrainerName() {
		return trainerName;
	}
	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getCell() {
		return cell;
	}
	public void setCell(String cell) {
		this.cell = cell;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getPrefer_add1() {
		return prefer_add1;
	}
	public void setPrefer_add1(String prefer_add1) {
		this.prefer_add1 = prefer_add1;
	}
	public String getPrefer_add2() {
		return prefer_add2;
	}
	public void setPrefer_add2(String prefer_add2) {
		this.prefer_add2 = prefer_add2;
	}
	public String getPrefer_add3() {
		return prefer_add3;
	}
	public void setPrefer_add3(String prefer_add3) {
		this.prefer_add3 = prefer_add3;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getTr_like() {
		return tr_like;
	}
	public void setTr_like(int tr_like) {
		this.tr_like = tr_like;
	}
	public String getBlack_yn() {
		return black_yn;
	}
	public void setBlack_yn(String black_yn) {
		this.black_yn = black_yn;
	}
	public String getLeave_yn() {
		return leave_yn;
	}
	public void setLeave_yn(String leave_yn) {
		this.leave_yn = leave_yn;
	}
	
	public String getPurpose_keyword() {
		return purpose_keyword;
	}
	public void setPurpose_keyword(String purpose_keyword) {
		this.purpose_keyword = purpose_keyword;
	}
	@Override
	public String toString() {
		return "Trainer [tr_email=" + tr_email + ", password=" + password + ", trainerName=" + trainerName + ", gender="
				+ gender + ", weight=" + weight + ", height=" + height + ", cell=" + cell + ", career=" + career
				+ ", address=" + address + ", address_detail=" + address_detail + ", prefer_add1=" + prefer_add1
				+ ", prefer_add2=" + prefer_add2 + ", prefer_add3=" + prefer_add3 + ", photo=" + photo + ", tr_like="
				+ tr_like + ", black_yn=" + black_yn + ", leave_yn=" + leave_yn + ", purpose_keyword=" + purpose_keyword
				+ "]";
	}
	

	
	
	
	
	
}