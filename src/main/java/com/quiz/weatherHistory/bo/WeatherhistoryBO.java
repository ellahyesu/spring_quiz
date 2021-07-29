package com.quiz.weatherHistory.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.weatherHistory.dao.WeatherhistoryDAO;
import com.quiz.weatherHistory.model.Weatherhistory;

@Service
public class WeatherhistoryBO {

	@Autowired
	private WeatherhistoryDAO weatherhistoryDAO;
	
	// List로 return 해주지 않으면 TooManyResultException error => 쿼리에서 가져온 데이터는 여러행인데, 받는 쪽에서 단건의 객체로 받으려 하기때문.
	// 즉 return type은 List임!!
	public List<Weatherhistory> getWeatherhistoryList() {
		return weatherhistoryDAO.selectWeatherhistoryList();
	}
	
	public void addWeatherHistory(String date, String weather, double temperatures, double precipitation, String microDust, double windSpeed) {
		weatherhistoryDAO.insertWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
	}
}
