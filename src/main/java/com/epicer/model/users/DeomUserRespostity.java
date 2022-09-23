package com.epicer.model.users;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;


//@Repository
//@Transactional
public interface DeomUserRespostity extends JpaRepository<DemoUser,Integer> {

	
	@Query(value="from DemoUser where name =?1")
	public DemoUser findByAccount(String account);
	
}
