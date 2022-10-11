package com.epicer.model.users;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;




@Repository
public interface UserRespostity extends JpaRepository<User, Integer> {
    //save(user); 
	//For Register :public User InsertCilent(User user); >
	
	//For Login :public User checkAccount(String account) >
	@Query(value="from User where account =?1")
	public User checkAccount(String account);
	
	//For LoginDate j: public User updateDate(User user)  > save(User);

	@Query(value="from User where status =?1")
	public List<User> checkStatus(int status);
	
	@Query(value="from User where userid =?1")
	public User findUser(int userid);
	
	
	public User findByAccountAndPassword(String account,String password);	

}
