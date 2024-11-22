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
	public int insertPost(WorkMatchDTO workMatchDTO) {

		int postCnt = workMatchDAO.insertPost(workMatchDTO);

		return postCnt;
	}

	@Override
	public int updatePost(WorkMatchDTO workMatchDTO) {

		int updateCnt = workMatchDAO.updatePost(workMatchDTO);

		return updateCnt;
	}

	@Override
	public int deletePost(String r_code) {

		int deleteCnt = 0;
		if(workMatchDAO.deletePost(r_code)>0) {
			workMatchDAO.deleteApplication(r_code);
			deleteCnt = 0;
		}
		return deleteCnt;
	}

	@Override
	public int insertApplication(WorkMatchDTO workMatchDTO) {
		int insertCnt = 0;
		insertCnt = workMatchDAO.insertApplication(workMatchDTO);

		return insertCnt;
	}

	@Override
	public int update_is_check(String mid) {
		int updateCnt = 0;
		updateCnt = workMatchDAO.update_is_check(mid);

		return updateCnt;
	}

}
