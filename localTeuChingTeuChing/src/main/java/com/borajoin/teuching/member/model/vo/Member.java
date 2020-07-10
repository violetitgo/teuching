package com.borajoin.teuching.member.model.vo;

public class Member {

	private String mem_email;
	private String nickname;
	private String password;
	private String gender;
	private String cell;
	private String address;
	private String leave_yn;
	private String manager_yn;
	
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCell() {
		return cell;
	}
	public void setCell(String cell) {
		this.cell = cell;
	}
	public String getLeave_yn() {
		return leave_yn;
	}
	public void setLeave_yn(String leave_yn) {
		this.leave_yn = leave_yn;
	}
	public String getManager_yn() {
		return manager_yn;
	}
	public void setManager_yn(String manager_yn) {
		this.manager_yn = manager_yn;
	}
	
	@Override
	public String toString() {
		return "Member [mem_email=" + mem_email + ", nickname=" + nickname + ", password=" + password + ", gender=" + gender
				+ ", cell=" + cell + ", address=" + address + ", leave_yn=" + leave_yn + ", manager_yn=" + manager_yn
				+ "]";
	}
	
	
	
	
	
	
	
}
