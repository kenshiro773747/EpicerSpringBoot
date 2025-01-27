package com.epicer.service.course;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.course.Teacher;
import com.epicer.model.course.TeacherRepository;

@Service
@Transactional
public class TeacherService {

	@Autowired
	private TeacherRepository tRepo;

	// INSERT
	public Teacher insertTeacher(Teacher newTeacher) {
		return tRepo.save(newTeacher);
	}

	// UPDATE
	public Teacher updateTeacher(Teacher editTeacher) {

		return tRepo.save(editTeacher);
	}

	// DELETE
	public void deleteTeacherById(Integer id) {

		tRepo.deleteById(id);
	}

	// SELECTBYID
	public Teacher getTeacherById(Integer id) {

		Optional<Teacher> optional = tRepo.findById(id);
		return optional.get();
	}

	// QUERYALL
	public List<Teacher> findAllTeacher() {
		return tRepo.findAll();
	}
	
	//QueryByStatus
	public List<Teacher> findTeacherByStatus(String status){
		return tRepo.findByTeacherStatus(status);
			
	}

	// IMG 上船自資料夾並回傳檔名
//	public String processImg(String courseName, MultipartFile photoData) throws IllegalStateException, IOException {
//
//		String filename = courseName + System.currentTimeMillis() + ".jpg";
//		String saveFileDir = "C:\\\\Users\\\\User\\\\Desktop\\\\EpicerSpringBoot\\\\src\\\\main\\\\webapp\\\\WEB-INF\\\\resources\\\\images";
//		File saveFilePath = new File(saveFileDir, filename);
//		photoData.transferTo(saveFilePath);
//		return filename;
//
//	}
	
	
	// 測試活的路徑
	public String processImg(String courseName, MultipartFile photoData) throws IllegalStateException, IOException {

		String filename = courseName + System.currentTimeMillis() + ".jpg";
		// String saveFileDir =
		// "C:\\Action\\worksapce\\第二組Epicer\\EpicerSpringBoot\\src\\main\\webapp\\WEB-INF\\resources\\images";
		// 存入該專案的位置寫法
		String classLocalPath = this.getClass().getClassLoader().getResource("").getPath();
		String classLocalPathModify = classLocalPath.substring(1).replaceAll("target", "src").replaceAll("classes",
				"main");
		String saveFileDir = classLocalPathModify + "webapp/WEB-INF/resources/images";
		File saveFilePath = new File(saveFileDir, filename);
		photoData.transferTo(saveFilePath);
		return filename;

	}

}
