package com.naver.aak;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkMatchDAO {

	int signUp(WorkMatchDTO workMatchDTO);
	
	int insertUserInfo(WorkMatchDTO workMatchDTO);
	
	int midCheck(WorkMatchDTO workMatchDTO);
	
	
}
