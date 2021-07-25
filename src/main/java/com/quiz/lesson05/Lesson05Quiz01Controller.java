package com.quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson05Quiz01Controller {

	@RequestMapping("/lesson05/quiz01")
	public String quiz01() {
		return "lesson05/quiz01";
	}
}
