package com.naver.aak;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	int loginCheck(LoginDTO loginDTO);
	
	int insertUserInfo(LoginDTO loginDTO);

	int midCheck(LoginDTO loginDTO);

	int infoUpdate(LoginDTO loginDTO);

	int deleteAccount(LoginDTO loginDTO);

	int deletePost(LoginDTO loginDTO);
	
	int imgUpdate(LoginDTO loginDTO);
	
	
	Map<String,Object> getInfo(String mid);
	
	Map<String,Object> getImg(String mid);
	
}
