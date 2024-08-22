package com.naver.aak;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
		
		Util.copyImg( loginDTO);
        
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
		String mid = loginDTO.getMid();
		String folderPath = "C:/Users/wjdgk/git/WorkMatch/workmatch/src/main/resources/static/img/" + mid;
		
		if( loginDAO.deletePost(loginDTO) != 1 )
			deleteCnt = loginDAO.deleteAccount(loginDTO);
		if(deleteCnt==1) { Util.fileDelete(folderPath); }
		
		return deleteCnt;
	}
	
	@Override
	public int imgUpdate(LoginDTO loginDTO){
		if(Util.saveFileToDirectory(loginDTO)==-13) { return -13; }
		
		int updateCnt = 0;
		updateCnt=loginDAO.imgUpdate(loginDTO);
		return updateCnt;
	}
	
	
	
	
	
	
}
