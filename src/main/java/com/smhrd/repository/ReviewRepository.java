package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Integer> {
	
	public List<Review> findAll();
	public List<Review> findByEmail(String email);
	
	
	

}
