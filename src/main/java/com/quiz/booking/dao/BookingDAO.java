package com.quiz.booking.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.booking.model.Booking;

@Repository
public interface BookingDAO {
	
	public List<Booking> selectBookingList();

	public int deleteBookingById(int id);
	
}
