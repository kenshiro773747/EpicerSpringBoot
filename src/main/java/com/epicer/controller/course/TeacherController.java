package com.epicer.controller.course;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.course.Course;
import com.epicer.model.course.Teacher;
import com.epicer.service.course.TeacherService;
import com.epicer.util.TimeTest;

@Controller
public class TeacherController {

	@Autowired
	private TeacherService TS;
	
	private TimeTest TT = new TimeTest();
	
	///LISTAll///
	@GetMapping(path = "/777")
	public String processMainAction(Model m) {
		List<Teacher> list = TS.findAllTeacher();
		m.addAttribute("listAll", list);
		return "course/teacherPageWithFrame";	
	}
	
	///INSERT///
	@PostMapping(path = "/beforeTeacherInsert")
	public String beforeTeacherInsert (Model m) {
		Teacher teacher = new Teacher();
		m.addAttribute("Teacher",teacher);
		return "course/teacherInsertWithFrame";
	}
	
	@PostMapping(path = "/insertTeacher")
	public String insertTeacher(@ModelAttribute("Teacher") Teacher teacher , MultipartFile photo,String county,String district, String road) throws IllegalStateException, IOException {
		
		if (!photo.isEmpty()) {
			String imgName = TS.processImg(teacher.getTeacherImage(), photo);
			teacher.setTeacherImage(imgName);
		}else {
			return null;	
		}
		String address = county+district+road;
		System.out.println(address);
		teacher.setTeacherAddress(address);
		
//		String birthday = TT.TransStringToDate(teacher.getTeacherBirthday());
//		teacher.setTeacherBirthday(birthday);
		TS.insertTeacher(teacher);
		return  "redirect:/777";		
	}
	
	///UPDATA///
	@PostMapping(path = "/beforeTeacherUpdate")
	public String beforeTeacherUpdate(@RequestParam("teacherId")int teacherId,Model m) {
		Teacher teacher = TS.getTeacherById(teacherId);
		m.addAttribute("Teacher",teacher);	
		return "course/teacherEditorWithFrame";	
	}
	
	@PostMapping(path = "/updateTeacher")
	public String updateTeacher(@ModelAttribute("Teacher") Teacher newTeacher,MultipartFile photo,String oldimg,String county,String district, String road) throws IllegalStateException, IOException {
		
		if (photo.isEmpty()) {
			newTeacher.setTeacherImage(oldimg);
		}else {
			String imgName = TS.processImg(newTeacher.getTeacherName(), photo);
			newTeacher.setTeacherImage(imgName);;		
		}
		String address = county+district+road;
		System.out.println(address);
		newTeacher.setTeacherAddress(address);
		
		TS.updateTeacher(newTeacher);
		return "redirect:/777";	
	}
	
	
	///DELETE///
	@PostMapping(path = "/deleteTeacher")
	public String deleteTeacher(@RequestParam("teacherId") Integer teacherId) {	
		TS.deleteTeacherById(teacherId);
		return "redirect:/777";
	}
	
	
	
	
	
	
	
}
