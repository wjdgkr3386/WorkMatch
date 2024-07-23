package com.naver.aak;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	int loginCheck(LoginDTO loginDTO);
	
	int signUp(LoginDTO loginDTO);
	
	int insertUserInfo(LoginDTO loginDTO);
	
	int midCheck(LoginDTO loginDTO);
}
