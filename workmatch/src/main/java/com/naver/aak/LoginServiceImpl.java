package com.naver.aak;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Service
public class LoginServiceImpl  implements LoginService {

	@Autowired
	LoginDAO loginDAO;

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
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
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

	@Override
	public int infoUpdate(LoginDTO loginDTO){
		int updateCnt = 0;

		updateCnt = loginDAO.infoUpdate(loginDTO);

		return updateCnt;
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

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
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@Override
	public int imgUpdate(LoginDTO loginDTO){
		int updateCnt = 0;
        String is_select = loginDTO.getIs_select();

        //1: 변경한 사진, 2: 기본이미지
        if(is_select.equals("2")) {
        	Util.copyImg(loginDTO);
        }else if(is_select.equals("1")) {
        	if(Util.saveFileToDirectory(loginDTO)==-13) { return -13; }
        }
        updateCnt=loginDAO.imgUpdate(loginDTO);

		 return updateCnt;
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


}
