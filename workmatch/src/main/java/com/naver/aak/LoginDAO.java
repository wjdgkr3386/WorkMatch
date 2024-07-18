package com.naver.aak;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {


	public int loginCheck(LoginDTO loginDTO);
}
