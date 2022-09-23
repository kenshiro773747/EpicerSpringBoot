package com.epicer.service.forum;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleUserBean;

public interface ArticleRepository extends JpaRepository<ArticleBean, Integer> {
	
	public List<ArticleBean> findAllByTitleLike(String title);

	public List<ArticleBean> findAllByPlateformCategoryIdLike(int id);
	
	public List<ArticleBean> findAllByUser(ArticleUserBean userId);
	
}
