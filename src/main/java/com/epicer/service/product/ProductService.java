package com.epicer.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.product.Product;
import com.epicer.model.product.ProductRepository;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	
	public List<Product> findAll() {
		return productRepository.findAll();
	}
	
	public List<Product> findCategoryAll(Integer productCategoryId) {
		return productRepository.findByProductCategoryId(productCategoryId);
	}
	
	public Product getById(Integer productId) {
		return productRepository.getById(productId);
	}
	
	public Product insert(Product product) {
		return productRepository.save(product);
	}
	
	public Product update(Product product) {
		return productRepository.save(product);
	}
	
	public void delete(Integer productId) {
		 productRepository.deleteById(productId);
	}
	
	
	

}
