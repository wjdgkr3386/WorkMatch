package com.naver.aak;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkMatchDAO {


	public int loginCheck(WorkMatchDTO workMatchDTO);
}
