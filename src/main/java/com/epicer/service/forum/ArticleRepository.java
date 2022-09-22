package com.epicer.service.forum;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleUserBean;

public interface ArticleRepository extends JpaRepository<ArticleBean, Integer> {
	
	public List<ArticleBean> findAllByTitleLike(String title);

	public List<ArticleBean> findAllByPlateformCategoryIdLike(int id);
	
	@Modifying
	@Query( value = "select * from forum_article where userid=?1",nativeQuery = true)
	public List<ArticleBean> findAllByUser(ArticleUserBean userId);
	
}
