package com.naver.aak;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkMatchDAO {

	int insertPost(WorkMatchDTO workMatchDTO);
	
	int searchResultCount(SearchDTO searchDTO);
	int searchAllCount(SearchDTO searchDTO);
	
	List<Map<String,Object>> search(SearchDTO searchDTO);

	Map<String,Object> getPost(String r_code);
	
	int getPostCnt(WorkMatchDTO workMatchDTO);

	int updatePost(WorkMatchDTO workMatchDTO);
	
	int deletePost(String r_code);

	List<Map<String,Object>> getMyPost(String mid);
	
	int insertApplication(WorkMatchDTO workMatchDTO);
	
	int checkApplication(WorkMatchDTO workMatchDTO);
	
	int checkApplicationCnt(String mid);
	
	List<Map<String, Object>> getApplicationMapList(String mid);

	int update_is_check(String mid);
	
	
}
