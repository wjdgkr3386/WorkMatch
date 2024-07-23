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
	public int signUp(LoginDTO loginDTO){
		int insertCnt = 0;
		
		insertCnt = loginDAO.midCheck(loginDTO);
		if(insertCnt>0) { return 3; }
			
		insertCnt = loginDAO.signUp(loginDTO);
		if(insertCnt==0) { return 0; }
		
		insertCnt = loginDAO.insertUserInfo(loginDTO);
		return insertCnt;
	}
}
