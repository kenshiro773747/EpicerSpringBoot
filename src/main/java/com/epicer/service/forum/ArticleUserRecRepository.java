package com.epicer.service.forum;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleCollectRecBean;
import com.epicer.model.forum.ArticleReplyBean;

public interface ArticleUserRecRepository extends JpaRepository<ArticleCollectRecBean, Integer> {
	
	
	@Query( value = "select * from forum_article_collect_rec where userid=?1",nativeQuery = true)
	public List<ArticleBean> findArticleByUserUserId(int userid);

	@Query( value = "select * from forum_article_collect_rec where userid=?1",nativeQuery = true)
	public List<ArticleReplyBean> findReplyByUserUserId(int userid);

}
