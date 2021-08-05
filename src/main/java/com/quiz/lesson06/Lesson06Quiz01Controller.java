package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {

	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addNewSite";
	}
	
	// AJAX의 요청이 왔을 때,
	// - 서버 쪽에서 @ResponseBody 어노테이션을 사용해야 한다.
	// - 리턴되는 값이 반드시 있어야 한다!!!!(아작스에서 젤 중요한게 리턴값이 스트링으로 리턴된다는 사실이에요)
	@PostMapping("/add_new_site")
	@ResponseBody
	public Map<String, String> addNewSite(
			@RequestParam("name") String name
			, @RequestParam("url") String url
	) {
		// DB Insert
		favoriteBO.addFavorite(name, url);
		
		// 성공 여부 리턴
		// {"result":"success"}
		// {"result":"error"}
		Map<String, String> resultMap = new HashMap<>();
		resultMap.put("result", "success");
		return resultMap; // jackson 라이브러리 때문에 json 리턴
	}
	
	// 즐겨찾기 목록 화면
	@RequestMapping("/get_site")
	public String getSite(Model model) {
		List<Favorite> favoriteList = favoriteBO.getSiteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/getSite";
	}
	
}
