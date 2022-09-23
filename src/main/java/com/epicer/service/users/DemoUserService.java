package com.epicer.service.users;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epicer.model.users.DemoUser;
import com.epicer.model.users.DeomUserRespostity;
import com.epicer.model.users.Message;

@Service
@Transactional
public class DemoUserService {

	
	@Autowired
	private DeomUserRespostity dur;
	
	public Message checkAccount(String account) {
		Message msg = new Message();
		DemoUser result = dur.findByAccount(account);
		if(result != null) {
			msg.setCode(0);
			msg.setMessage("ok");
			msg.setObject(result);
		}else {
			msg.setCode(1);
			msg.setMessage("Not found");
			msg.setObject(result);
		}
		return msg;			
	}
}
