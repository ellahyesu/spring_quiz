package com.quiz.booking.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.booking.model.Booking;

@Repository
public interface BookingDAO {
	
	public List<Booking> selectBookingList();
	
	public Booking selectBookingListByNameAndPhoneNumber(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);

	public int deleteBookingById(int id);
	
	public int insertBooking(@Param("name") String name
			, @Param("date") String date
			, @Param("day") int day
			, @Param("headcount") int headcount
			, @Param("phoneNumber") String phoneNumber
			, @Param("state") String state);
	
}
