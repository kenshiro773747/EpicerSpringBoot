package com.epicer.controller.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epicer.model.product.Product;
import com.epicer.service.product.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
//	後台首頁為http://localhost:8081/product
	@GetMapping("/product")
	private String findAll(Model m) {
		List<Product> beans=productService.findAll();
		m.addAttribute("findAll",beans);
		return "product/adminProduct";
	}
	
//	registry.addResourceHandler("productCategory/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
//	要加上面那行才可以
//	@GetMapping(path="/productCategory/{productCategoryId}")
//	public String findCategoryAll(@PathVariable("productCategoryId") Integer productCategoryId ,Model m) {
//		System.out.println(productCategoryId);
//		List<Product> beans=productService.findCategoryAll(productCategoryId);
//		m.addAttribute("findCategoryAll",beans);
//		System.out.println(beans.get(1));
//		return "product/adminProductCategory";
//	}
	
	@GetMapping(path="/productCategory")
	public String findCategoryAll(@RequestParam("productCategoryId") Integer productCategoryId ,Model m) {
		System.out.println(productCategoryId);
		List<Product> beans=productService.findCategoryAll(productCategoryId);
		m.addAttribute("findCategoryAll",beans);
		System.out.println(beans.get(1));
		return "product/adminProductCategory";
	}
	
	
	@GetMapping("/insertProduct")
	public String insertProduct() {
		return "product/adminProductInsert";
	}
	
	@PostMapping("/insertProductAction")
	public String insertProductAction(Product bean) {
		productService.insert(bean);
		return "redirect:product";
	}
	
	@PostMapping("/updateProduct")
	public String updateProduct() {
		System.out.println(123);
		return "product/adminProductUpdate";
	}
	
	@PostMapping("/updateProductAction")
	public String updateProductAction(Product bean) {
		System.out.println(bean.getProductName());
		productService.update(bean);
		return "redirect:product";
	}
	
	@PostMapping("/deleteProductAction")
	public String deleteProductAction(Product bean) {
		productService.delete(bean.getProductId());
		return "redirect:product";
	}
	
	
	
}
