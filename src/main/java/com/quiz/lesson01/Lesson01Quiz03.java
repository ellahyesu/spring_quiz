package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // jsp를 내려줄 때는 @ResponseBody가 사용되지 않는다.
public class Lesson01Quiz03 {

	// 요청 URL : http://localhost/lesson01/quiz03/1
	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03_1() {
		return "lesson01/quiz03_1";
	}
}
