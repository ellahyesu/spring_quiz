package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {

	@Autowired
	private RealtorBO realtorBO;
	
	// 입력 form URL - http://localhost/lesson04/quiz02/1
	@GetMapping("/1")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	// 1. 파라미터를 받는다
	// 2. 받은 파라미터를 insert로 받는다
	// 3. DB에서 select를 해와서 아래 페이지에 넣는다
	
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model
	) {
		realtorBO.addRealtor(realtor);
		realtor = realtorBO.getRealtorById(realtor.getId());
		model.addAttribute("result", realtor);
		model.addAttribute("subject", "공인중개사 정보");
		
		return "lesson04/afterAddRealtor";
	}
}
