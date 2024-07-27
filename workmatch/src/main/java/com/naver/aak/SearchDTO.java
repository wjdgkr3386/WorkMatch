package com.naver.aak;

import java.util.ArrayList;
import java.util.List;

public class SearchDTO {
	
	private int selectPageNo;				//선택한 페이지번호	
	private int rowCnt;						//행보기
	private int begin_rowNo;				//테이블 검색 시 시작행 번호
	private int end_rowNo;					// 테이블 검색 시 끝행 번호

	private String keyword;					// 테이블 검색 시 끝행 번호
	private List<String> detailsRegion;	// 상세지역
	
	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}
	public int getBegin_rowNo() {
		return begin_rowNo;
	}
	public void setBegin_rowNo(int begin_rowNo) {
		this.begin_rowNo = begin_rowNo;
	}
	public int getEnd_rowNo() {
		return end_rowNo;
	}
	public void setEnd_rowNo(int end_rowNo) {
		this.end_rowNo = end_rowNo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public List<String> getDetailsRegion() {
		return detailsRegion;
	}
	public void setDetailsRegion(List<String> detailsRegion) {
		this.detailsRegion = detailsRegion;
	}
	
	
}
