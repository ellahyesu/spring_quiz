package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson05")
@Controller
public class Lesson05QuizController {

	@RequestMapping("/quiz01")
	public String quiz01() {
		return "lesson05/quiz01";
	}
	
	@RequestMapping("/quiz02/1")
	public String quiz02_1(Model model) {
		
		// 1. JSTL forEach
		// 아래와 같이 가요 순위 HOT5 가 순위대로 저장 되어 있다.
		// 해당 리스트를 컨트롤러에서 Model을 통해서 jsp 에 전달하고, 아래와 같은 화면을 구성하세요.
		List<String> musicRanking = new ArrayList<>();
		musicRanking.add("강남스타일");
		musicRanking.add("벚꽃엔딩");
		musicRanking.add("좋은날");
		musicRanking.add("거짓말");
		musicRanking.add("보고싶다");
		
		model.addAttribute("musicRanking", musicRanking);
		
		return "lesson05/quiz02_1";
	}
	
	@RequestMapping("/quiz02/2")
	public String quiz02_2(Model model) {
		
//		2. JSTL 응용하기
//		아래와 같이 멤버십 저장되어 있는 리스트 맵이 아래와 있다.
//		멤버십 정보에는 이름, 전화번호, 등급, 포인트 가 저장되어 있다.
//		
//		해당 리스트 맵을 컨트롤러에서 Model을 통해서 jsp 에 전달하고, 아래와 같은 화면을 구성하세요.
//		등급이 VIP인경우 글씨를 빨간색으로, 등급이 GOLD인경우 노란색으로 표시하세요.
//		포인트가 5000점 이상이면 포인트를 파란색으로 표시하세요.
		List<Map<String, Object>> membership = new ArrayList<>();

		Map<String, Object> member = new HashMap<>();
		member.put("name", "손오공");
		member.put("phoneNumber", "010-1234-5678");
		member.put("grade", "VIP");
		member.put("point", 12040);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "저팔계");
		member.put("phoneNumber", "010-4321-1234");
		member.put("grade", "BASIC");
		member.put("point", 3420);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "사오정");
		member.put("phoneNumber", "010-8888-1111");
		member.put("grade", "GOLD");
		member.put("point", 1530);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "삼장");
		member.put("phoneNumber", "010-0000-1234");
		member.put("grade", "GOLD");
		member.put("point", 8450);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "우마왕");
		member.put("phoneNumber", "010-1111-2222");
		member.put("grade", "BASIC");
		member.put("point", 420);
		membership.add(member);
		
		model.addAttribute("membership", membership);
		
		return "lesson05/quiz02_2";
	}
	
	@RequestMapping("/quiz03/1")
	public String quiz03_1(Model model) {
		
		List<Integer> candidates = new ArrayList<>();
		candidates.add(263001);
		candidates.add(173942); 
		candidates.add(563057); 
		
		model.addAttribute("candidates", candidates);
		
		return "lesson05/quiz03_1";
	}
	
	@RequestMapping("/quiz03/2")
	public String quiz03_2(Model model) {
		
		List<Map<String, Object>> cardBills = new ArrayList<>();

		Map<String, Object> cardBill = new HashMap<>();
		cardBill.put("store", "GS48");
		cardBill.put("pay", 7800);
		cardBill.put("date", "2025-09-14");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "현태백화점");
		cardBill.put("pay", 2750000);
		cardBill.put("date", "2025-09-18");
		cardBill.put("installment", "3개월");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "요촌치킨");
		cardBill.put("pay", 180000);
		cardBill.put("date", "2025-09-20");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);
		
		model.addAttribute("cardBills", cardBills);
		
		return "lesson05/quiz03_2";
	}

}
