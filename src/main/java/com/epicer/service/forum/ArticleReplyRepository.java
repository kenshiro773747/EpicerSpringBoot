package com.epicer.service.forum;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.epicer.model.forum.ArticleReplyBean;

public interface ArticleReplyRepository extends JpaRepository<ArticleReplyBean, Integer> {

	public List<ArticleReplyBean> findAllByUser(int id);

	public List<ArticleReplyBean> findAllByArticleId(int id);
	
}
