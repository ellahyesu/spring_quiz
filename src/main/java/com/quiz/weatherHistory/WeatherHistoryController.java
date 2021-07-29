package com.quiz.weatherHistory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.weatherHistory.bo.WeatherhistoryBO;
import com.quiz.weatherHistory.model.Weatherhistory;

@RequestMapping("/weatherHistory")
@Controller
public class WeatherHistoryController {
	
	@Autowired
	private WeatherhistoryBO weatherhistoryBO;
	
	@RequestMapping("/weather_history_view")
	public String weatherHistoryView(Model model) {
		List<Weatherhistory> weatherhistory = weatherhistoryBO.getWeatherhistoryList();
		model.addAttribute("weatherhistory", weatherhistory);
		return "weatherHistory/getWeatherhistory";
	}
	
	@RequestMapping("/add_weather_view")
	public String addWeatherView() {
		return "weatherHistory/addWeather";
	}
	
	// 무조건 Post로 들어올때만 가능하도록 설정
	// @RequestMapping(path="/add_weather", method=RequestMethod.POST) 
	@PostMapping("/add_weather")
	public String addWeatherView(
			@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("microDust") String microDust,
			@RequestParam("windSpeed") double windSpeed
	) {
		// DB insert
		weatherhistoryBO.addWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		// redirect: 완전히 새로운 request를 하는 것과 같으므로 RequestMapping에 있는 path를 써준다.
		return "redirect:/weatherHistory/weather_history_view";
	}
	
}
