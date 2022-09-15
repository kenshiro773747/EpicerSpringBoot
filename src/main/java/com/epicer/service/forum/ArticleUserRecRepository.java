package com.epicer.service.forum;

import org.springframework.data.jpa.repository.JpaRepository;

import com.epicer.model.forum.ArticleCollectRecBean;

public interface ArticleUserRecRepository extends JpaRepository<ArticleCollectRecBean, Integer> {

}
