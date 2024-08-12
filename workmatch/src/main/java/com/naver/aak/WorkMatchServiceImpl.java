package com.naver.aak;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class WorkMatchServiceImpl  implements WorkMatchService {

	@Autowired
	WorkMatchDAO workMatchDAO;

	public int insertPost(WorkMatchDTO workMatchDTO) {
		
		int postCnt = workMatchDAO.insertPost(workMatchDTO);
		
		return postCnt;
	}

	public int updatePost(WorkMatchDTO workMatchDTO) {
		
		int updateCnt = workMatchDAO.updatePost(workMatchDTO);
		
		return updateCnt;
	}
	
	public int deletePost(String r_code) {
		
		int deleteCnt = workMatchDAO.deletePost(r_code);
		
		return deleteCnt;
	}
	
	
}
