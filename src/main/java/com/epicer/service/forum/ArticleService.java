package com.epicer.service.forum;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.forum.ArticleBean;

@Service
@Transactional
public class ArticleService {

	@Autowired
	private ArticleRepository aRepo;

	public ArticleBean findById(int replyId) {
		Optional<ArticleBean> op = aRepo.findById(replyId);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
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

	public void deleteById(int id) {
		aRepo.deleteById(id);
	}

}
