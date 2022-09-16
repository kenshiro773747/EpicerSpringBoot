package com.epicer.service.forum;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleCollectRecBean;
import com.epicer.model.forum.ArticleReplyBean;

public interface ArticleUserRecRepository extends JpaRepository<ArticleCollectRecBean, Integer> {
	
	public List<ArticleBean> findArticleByUserIdLike(int userid);

	public List<ArticleReplyBean> findReplyByUserIdLike(int userid);

}
