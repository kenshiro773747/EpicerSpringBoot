package com.epicer.service.forum;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleReplyBean;
import com.epicer.model.forum.ArticleUserBean;

public interface ArticleReplyRepository extends JpaRepository<ArticleReplyBean, Integer> {

	public List<ArticleReplyBean> findAllByUser(ArticleUserBean id);

	public List<ArticleReplyBean> findAllByArticleId(ArticleBean id);
	
	
	@Modifying
	@Query( value = "update forum_article_reply set article_reply_content=?1 , article_reply_date=?2 where article_reply_id=?3",nativeQuery = true)
	public int update(String replyContent,long date,int articleReplyId);
	
}
