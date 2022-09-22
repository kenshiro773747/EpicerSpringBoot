package com.epicer.service.forum;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleUserBean;

@Service
@Transactional
public class ArticleService {

	@Autowired
	private ArticleRepository aRepo;

	public ArticleBean findByArticleId(int articleId) {
		Optional<ArticleBean> op = aRepo.findById(articleId);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	
	
	public List<ArticleBean> findByUser(ArticleUserBean userId) {
		return aRepo.findAllByUser(userId);
	}

	public List<ArticleBean> findByTitleLike(String title) {
		return aRepo.findAllByTitleLike(title);
	}

	public List<ArticleBean> findByCategoryLike(int id) {
		return aRepo.findAllByPlateformCategoryIdLike(id);
	}

	public List<ArticleBean> findAll() {
		return aRepo.findAll();
	}

	public ArticleBean insert(ArticleBean articleBean) {
		return aRepo.save(articleBean);
	}

	public void deleteById(Integer id) {
		aRepo.deleteById(id);
	}

}
