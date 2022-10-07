package com.epicer.model.course;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface orderCourseRepository extends JpaRepository<ordercourse, Integer> {

	///從課程id找出的list///
	public List<ordercourse> findBycourseidLike(Course courseId);
	
}
