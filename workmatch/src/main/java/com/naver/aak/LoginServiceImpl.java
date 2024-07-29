package com.naver.aak;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class LoginServiceImpl  implements LoginService {

	@Autowired
	LoginDAO loginDAO;

	@Override
	public int insertUserInfo(LoginDTO loginDTO){
		int insertCnt = 0;
		
		insertCnt = loginDAO.midCheck(loginDTO);
		if(insertCnt>0) { return 3; }
		
		insertCnt = loginDAO.insertUserInfo(loginDTO);
		if(insertCnt==0) { return 0; }
		
		return insertCnt;
	}

	@Override
	public int infoUpdate(LoginDTO loginDTO){
		int updateCnt = 0;
		
		updateCnt = loginDAO.infoUpdate(loginDTO);
		
		return updateCnt;
	}
	
	@Override
	public int deleteAccount(LoginDTO loginDTO){
		int deleteCnt = 0;

		loginDAO.deletePost(loginDTO);
		
		deleteCnt = loginDAO.deleteAccount(loginDTO);
		
		return deleteCnt;
	}
	
	
	
}
