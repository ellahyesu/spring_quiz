package com.quiz.lesson06;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz02")
@Controller
public class Lesson06Quiz02Controller {

	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/is_duplication")
	@ResponseBody
	public Map<String, Boolean> isUrlDuplication(
			@RequestParam("url") String url) {
		// url 중복인지 DB 확인
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplication", false);
		if (favorite != null)
			result.put("is_duplication", true);
		
		return result;
	}
	
	@RequestMapping("/delete_favorite_by_id")
	@ResponseBody
	public String isDeleteFavoriteById(
			@RequestParam("favorite_id") int id) {
		// DB - id로 delete
		int row = favoriteBO.deleteFavoriteById(id);
		// return 결과 행이 1이면 성공 아니면 실패
		return row == 1 ? "success" : "fail";
	}
}
