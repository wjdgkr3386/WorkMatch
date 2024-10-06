package com.naver.aak;

public interface WorkMatchService {
	int insertPost(WorkMatchDTO workMatchDTO) throws Exception;
	int updatePost(WorkMatchDTO workMatchDTO) throws Exception;
	int deletePost(String r_code) throws Exception;
	int insertApplication(WorkMatchDTO workMatchDTO) throws Exception;
	int update_is_check(String mid) throws Exception;
}
