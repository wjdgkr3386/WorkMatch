package com.naver.aak;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class WorkMatchServiceImpl  implements WorkMatchService {

	@Autowired
	WorkMatchDAO workMatchDAO;
	
	@Override
	public int signUp(WorkMatchDTO workMatchDTO){
		int insertCnt = 0;
		
		insertCnt = workMatchDAO.midCheck(workMatchDTO);
		if(insertCnt>0) { return 3; }
			
		insertCnt = workMatchDAO.signUp(workMatchDTO);
		if(insertCnt==0) { return 0; }
		
		insertCnt = workMatchDAO.insertUserInfo(workMatchDTO);
		return insertCnt;
	}
}
