package com.quiz.weatherHistory.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.weatherHistory.model.Weatherhistory;

@Repository
public interface WeatherhistoryDAO {
	
	public List<Weatherhistory> selectWeatherhistoryList();

	public void insertWeatherHistory(
			@Param("date") String date,
			@Param("weather") String weather,
			@Param("temperatures") double temperatures,
			@Param("precipitation") double precipitation,
			@Param("microDust") String microDust,
			@Param("windSpeed") double windSpeed);
}
