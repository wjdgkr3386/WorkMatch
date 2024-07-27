package com.naver.aak;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkMatchDAO {

	int insertPost(WorkMatchDTO workMatchDTO);
	
	int searchResultCount(SearchDTO searchDTO);
	List<Map<String,Object>> search(SearchDTO searchDTO);

	Map<String,Object> getPost(String r_code);
	
	int getPostCnt(WorkMatchDTO workMatchDTO);
	
	int updatePost(WorkMatchDTO workMatchDTO);
	
	
}
