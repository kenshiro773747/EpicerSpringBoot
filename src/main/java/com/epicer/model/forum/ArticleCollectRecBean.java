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
@Table(name = "forum_article_collect_rec")
@Component
public class ArticleCollectRecBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Id
	@Column(name = "collectarticlerec")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer collectArticleRec;


	@Column(name = "articleid")
	private Integer articleId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JsonIgnoreProperties(value="userId")
	@JoinColumn(name = "userid")
	private ArticleUserBean user;

	public ArticleCollectRecBean() {
		super();
	}

	public ArticleCollectRecBean(Integer collectArticleRec, Integer articleId, ArticleUserBean user) {
		super();
		this.collectArticleRec = collectArticleRec;
		this.articleId = articleId;
		this.user = user;
	}

	public Integer getCollectArticleRec() {
		return collectArticleRec;
	}

	public void setCollectArticleRec(Integer collectArticleRec) {
		this.collectArticleRec = collectArticleRec;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public ArticleUserBean getUser() {
		return user;
	}

	public void setUser(ArticleUserBean user) {
		this.user = user;
	}

	

	

}
