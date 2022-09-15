package com.epicer.model.forum;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "article_reply")
@Component
public class ArticleReplyBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "article_reply_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer articleReplyId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "article_id")
	@JsonIgnoreProperties(value="article_id")
	private ArticleBean articleId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	@JsonIgnoreProperties(value="userId")
	private ArticleUserBean user;

	@Column(name = "article_reply_content")
	private String articleReplyContent;

	@Column(name = "article_reply_date")
	private Long articleReplyDate;

	public ArticleReplyBean() {
		super();
	}

	public ArticleReplyBean(ArticleBean articleId, ArticleUserBean user, String articleReplyContent,
			Long articleReplyDate) {
		super();
		this.articleId = articleId;
		this.user = user;
		this.articleReplyContent = articleReplyContent;
		this.articleReplyDate = articleReplyDate;
	}

	public Integer getArticleReplyId() {
		return articleReplyId;
	}

	public void setArticleReplyId(Integer articleReplyId) {
		this.articleReplyId = articleReplyId;
	}

	public ArticleBean getArticleId() {
		return articleId;
	}

	public void setArticleId(ArticleBean articleId) {
		this.articleId = articleId;
	}

	public ArticleUserBean getUser() {
		return user;
	}

	public void setUser(ArticleUserBean user) {
		this.user = user;
	}

	public String getArticleReplyContent() {
		return articleReplyContent;
	}

	public void setArticleReplyContent(String articleReplyContent) {
		this.articleReplyContent = articleReplyContent;
	}

	public Long getArticleReplyDate() {
		return articleReplyDate;
	}

	public void setArticleReplyDate(Long articleReplyDate) {
		this.articleReplyDate = articleReplyDate;
	}

}
