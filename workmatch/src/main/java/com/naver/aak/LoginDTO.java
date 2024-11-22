package com.naver.aak;

import org.springframework.web.multipart.MultipartFile;

public class LoginDTO {


	String name;						//이름
	String mid;						//아이디
	String pwd;						//패스워드
	String jumin_number1;		//주민번호 앞자리
	String jumin_number2;		//주민번호 뒷자리
	String phone_number1;		//폰번호 앞자리
	String phone_number2;		//폰번호 가운데
	String phone_number3;		//폰번호 뒷자리
	String email;						//이메일
	String occupation;				//직종
	String region;					//주소지
	String address;					//상세주소

	MultipartFile img;				//파일
	String img_name;				//파일이름
	String is_select;				//삭제를 눌렀는지 확인
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getJumin_number1() {
		return jumin_number1;
	}
	public void setJumin_number1(String jumin_number1) {
		this.jumin_number1 = jumin_number1;
	}
	public String getJumin_number2() {
		return jumin_number2;
	}
	public void setJumin_number2(String jumin_number2) {
		this.jumin_number2 = jumin_number2;
	}
	public String getPhone_number1() {
		return phone_number1;
	}
	public void setPhone_number1(String phone_number1) {
		this.phone_number1 = phone_number1;
	}
	public String getPhone_number2() {
		return phone_number2;
	}
	public void setPhone_number2(String phone_number2) {
		this.phone_number2 = phone_number2;
	}
	public String getPhone_number3() {
		return phone_number3;
	}
	public void setPhone_number3(String phone_number3) {
		this.phone_number3 = phone_number3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public MultipartFile getImg() {
		return img;
	}
	public void setImg(MultipartFile img) {
		this.img = img;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getIs_select() {
		return is_select;
	}
	public void setIs_select(String is_select) {
		this.is_select = is_select;
	}


}
