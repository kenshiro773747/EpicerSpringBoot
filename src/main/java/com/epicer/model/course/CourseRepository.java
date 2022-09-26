package com.epicer.model.course;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CourseRepository extends JpaRepository<Course, Integer> {
	
	//大寫測試
	public List<Course>  findByCourseStyleLike(String Style);

	
}
