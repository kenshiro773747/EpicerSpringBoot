package com.epicer.service.users;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epicer.model.users.Message;
import com.epicer.model.users.User;
import com.epicer.model.users.UserRespostity;


@Service
@Transactional
public class LoginService {
	@Autowired
private UserRespostity ur;
	
	public LoginService(UserRespostity ur) {
		super();
		this.ur = ur;
	}

	public void test() {
		User user = ur.findByAccountAndPassword("emp12345@epicer.com", "emp12345");
		System.out.println(user.getAccount());
		System.out.println(user.getPassword());
	}
	
	
	public Message checkAccount(String account) {
		Message msg = new Message();
		User user = ur.checkAccount(account);
		if(user==null || user.getStatus()==4) {
			msg.setCode(1);
			msg.setMessage("帳號不存在");
		}else {
			msg.setCode(0);
			msg.setMessage("ok");
			msg.setObject(user);
		}
		return msg;
	}
	
	public Message cheackPassword(String account,String password) {
	   Message msg = new Message();
	   User user = ur.checkAccount(account);
	   if(user == null) { //帳號不存在
		   msg.setCode(1);
		   msg.setMessage("帳號不存在");
	   }else { //帳號存在
		   if(password.equals(user.getPassword())){
			   msg.setCode(0);
			   msg.setMessage("ok");
		   }else {
			   msg.setCode(1);
			   msg.setMessage("密碼不正確");
		   }
	   }
	   return msg;
	}
	
	
	
	public User showIndex(String account) {
		User user = ur.checkAccount(account);
		return user;
	}
	
	public User updateDate(User user) {
		Date date = new Date();
		System.out.println(date);
		user.setLogindate(date.getTime());
		User admin =ur.save(user);
		return admin;
	}
	
}
