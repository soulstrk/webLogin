package com.soulstrk;

public class MemberDTO {
	private String username;
	private String password;
	private String email;
	private String date;
	private String gender;
	
	public MemberDTO() {}
	public MemberDTO(String username, String password, String email,String gender) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.gender = gender;
	}
	public MemberDTO(String username, String password, String email,String gender,
			String date) { // 가입일 가져오기 위한 생성자
		this.username = username;
		this.password = password;
		this.email = email;
		this.date = date;
		this.gender = gender;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "MemberDTO [닉네임=" + username + ", 비밀번호=" + password + ", 이메일=" + email + ", 가입날짜=" + date
				+ "]";
	}
	
}
