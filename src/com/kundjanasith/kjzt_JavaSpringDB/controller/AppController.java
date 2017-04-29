package com.kundjanasith.kjzt_JavaSpringDB.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kundjanasith.kjzt_JavaSpringDB.database.Student;
import com.kundjanasith.kjzt_JavaSpringDB.database.StudentJDBCTemplate;

@Controller
@RequestMapping("/")
public class AppController {
	
	@Autowired
	private StudentJDBCTemplate studentJDBCTemplate;

	@RequestMapping(value = { "/"}, method = RequestMethod.GET)
	public String homePage() {
		return "home";
	}
	
	@GetMapping(value = { "/addNewStudent"})
	public ModelAndView addNewStudentForm() {
		Student student = new Student();
		return new ModelAndView("addNewStudent", "student", student);
	}
	
	@PostMapping(value = { "/addNewStudent"})
	public ModelAndView addNewStudentSubmit(@ModelAttribute("student") Student student) {
		boolean isValid = ( !student.getName().isEmpty() && !student.getGpax().isNaN() && !student.getAmbition().isEmpty() ) ? true : false;
		if( isValid ) {
			student.setId(studentJDBCTemplate.listStudents().size() + 1);
			System.out.println(student.toString());
			studentJDBCTemplate.create(student.getName(), student.getGpax(), student.getAmbition());
			return new ModelAndView("home", "message", "Succesfully Add New Student");
		}
		return new ModelAndView("addNewStudent", "message", "Invalid inputs!");
	}
	
	@GetMapping(value = { "/viewStudents"})
	public ModelAndView studentsListPage(ModelMap model) {
		Map<String, List<Student>> students = new HashMap<String, List<Student>>();
		students.put("students", studentJDBCTemplate.listStudents());
		for ( Student student : studentJDBCTemplate.listStudents()) {
			System.out.println(student);
		}
		return new ModelAndView("viewStudents", students);
	}
	
	@GetMapping("/editStudent/{id}")
	public ModelAndView editStudentPage(@PathVariable Integer id) {
		Student student = studentJDBCTemplate.getStudent(id);
		return new ModelAndView("editStudent", "student", student);
	}
	
	@PostMapping("/editStudent/{id}")
	public ModelAndView editStudentSubmit(@ModelAttribute Student student, ModelMap model) {
		System.out.println("Updating: " + student);
		studentJDBCTemplate.update(student.getId(), student.getName(), student.getGpax(), student.getAmbition());
		return studentsListPage(model.addAttribute("message", "Successfully edited student"));
	}
	
	@PostMapping("deleteStudent/{id}")
	public ModelAndView deleteStudent(@PathVariable Integer id, ModelMap model) {
		System.err.println("[REMOVE] Student @ID " + id);
		studentJDBCTemplate.delete(id);
		return studentsListPage(model);
	}
	
}




