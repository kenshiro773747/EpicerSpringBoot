package com.epicer.model.product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	public List<Product> findByProductCategoryId(Integer productCategoryId);

}
