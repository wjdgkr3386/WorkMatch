package com.naver.aak;

import org.springframework.web.multipart.MultipartFile;

public class WorkMatchDTO {
	String mid;					//계정
	String r_code;				//랜덤코드
	
	
	String title;					//구인글제목
	String company;			//업체명
	String participants;		//모집인원
	String recruitment;			//모집내용
	String job;						//업무내용
	String income;				//급여
	String condition;			//자격조건
	String region;				//근무지역
	String address;				//근무지주소
	String phone_number	;	//연락처
	String email;					//이메일
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getR_code() {
		return r_code;
	}
	public void setR_code(String r_code) {
		this.r_code = r_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getParticipants() {
		return participants;
	}
	public void setParticipants(String participants) {
		this.participants = participants;
	}
	public String getRecruitment() {
		return recruitment;
	}
	public void setRecruitment(String recruitment) {
		this.recruitment = recruitment;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
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
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
