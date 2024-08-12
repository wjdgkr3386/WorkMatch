package com.naver.aak;

public interface LoginService {

	int insertUserInfo(LoginDTO loginDTO) throws Exception;
	
	int infoUpdate(LoginDTO loginDTO) throws Exception;

	int deleteAccount(LoginDTO loginDTO) throws Exception;
	
	int imgUpdate(LoginDTO loginDTO) throws Exception;
	
}
