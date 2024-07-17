package com.naver.aak;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class WorkMatchServeiceImpl {

	@Autowired
	WorkMatchDAO workMatchDAO;
	

}
