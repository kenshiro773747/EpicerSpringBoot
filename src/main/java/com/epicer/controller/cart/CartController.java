package com.epicer.controller.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {

	// 管理員全部購物車
	// 連線網址路徑: http://localhost:8081/admincart
	@GetMapping("/admincart")
	public String processAdminCartAction() {
		return "cart/admincart";
	}

	// 一般會員個人購物車
	// 連線網址路徑: http://localhost:8081/usercart
	@GetMapping("/usercart")
	public String processUserCartAction() {
		return "cart/usercart";
	}
	
	
	// 管理員查全部訂單
	// 連線網址路徑: http://localhost:8081/adminorder
	@GetMapping("/adminorder")
	public String processAdminOrderAction() {
		return "cart/adminorder";
	}

	// 一般會員個人訂單
	// 連線網址路徑: http://localhost:8081/userorder
	@GetMapping("/userorder")
	public String processUserOrderAction() {
		return "cart/userorder";
	}
	

}