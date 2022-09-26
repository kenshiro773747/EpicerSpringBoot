package com.epicer.controller.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.epicer.model.users.DemoUser;
import com.epicer.model.users.Message;
import com.epicer.service.users.DemoUserService;

@Controller
@SessionAttributes(names={"user"})
public class TestController {

	
	@Autowired
	public DemoUserService dus;
	
	
	@GetMapping(path="/index")
	public String processMainAction() {
		return "users/index";
	}
	
	
	@GetMapping(path="/blanklogin")
	public String processMainAction2() {
		return "users/blanklogin";
	}
	
		
	
	//test 非同步
	@PostMapping(path="/logintest")
	@ResponseBody
	public Message testAction(@RequestBody DemoUser user) {
		Message msg = dus.checkAccount(user.getName());
		return msg;
	}
	
	
	@GetMapping(path="/login")
	public String processLogin() {
		return "users/login";
	}
	
//	@PostMapping(path="/dologin")
//	public String doLogin(@RequestParam("name") String name,@RequestParam("password") String password,Model m) {
//		DemoUser result = dus.checkAccount(name);
//		if(result == null) {
//			m.addAttribute("msg","Account is not exist!");
//			return"users/login";
//	}else {
//		if(password.equals(result.getPassword())) {
//			m.addAttribute("user",result);
//			m.addAttribute("msg","sucess");
//			return "users/index";			
//		}else {
//			m.addAttribute("name",name);
//			m.addAttribute("password",password);
//			m.addAttribute("msg","check again your password!");
//			return"users/login";
//		}
//	}
//}
}