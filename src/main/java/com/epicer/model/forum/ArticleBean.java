package com.epicer.model.forum;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "forum_article")
@Component
public class ArticleBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "article_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int articleId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	@JsonIgnoreProperties(value="userId")
	private ArticleUserBean user;
	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "articleId",cascade = CascadeType.ALL)
	@JsonIgnore
	private List<ArticleReplyBean> articleReplyId = new ArrayList<ArticleReplyBean>();
	
	@Column(name = "article_category", updatable = false)
	private int plateformCategoryId;

	@Column(name = "article_title")
	private String title;

	@Column(name = "article_content")
	private String articleContent;

	@Column(name = "article_status")
	private String status;

	@Column(name = "article_date")
	private Long date;

	@Column(name = "article_like")
	private int articleLike;

	public ArticleBean() {
		super();
	}

	public ArticleBean(int plateformCategoryId, String title, String articleContent, Long time,ArticleUserBean userId) {
		super();
		this.title = title;
		this.articleContent = articleContent;
		this.plateformCategoryId = plateformCategoryId;
		this.date = time;
		this.user = userId;
	}

	public ArticleBean(String title, String articleContent) {
		super();
		this.title = title;
		this.articleContent = articleContent;

	}
	
	

	public ArticleBean(int articleId, ArticleUserBean user, int plateformCategoryId, String title,
			String articleContent, String status, Long date, int articleLike) {
		super();
		this.articleId = articleId;
		this.user = user;
		this.plateformCategoryId = plateformCategoryId;
		this.title = title;
		this.articleContent = articleContent;
		this.status = status;
		this.date = date;
		this.articleLike = articleLike;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public ArticleUserBean getUser() {
		return user;
	}

	public void setUser(ArticleUserBean user) {
		this.user = user;
	}

	public int getPlateformCategoryId() {
		return plateformCategoryId;
	}

	public void setPlateformCategoryId(int plateformCategoryId) {
		this.plateformCategoryId = plateformCategoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getDate() {
		return date;
	}

	public void setDate(Long date) {
		this.date = date;
	}

	public int getArticleLike() {
		return articleLike;
	}

	public void setArticleLike(int articleLike) {
		this.articleLike = articleLike;
	}

	public List<ArticleReplyBean> getArticleReplyId() {
		return articleReplyId;
	}

	public void setArticleReplyId(List<ArticleReplyBean> articleReplyId) {
		this.articleReplyId = articleReplyId;
	}

	

	

}
