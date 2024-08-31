package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.Movie;



@Repository
public interface MovieRepository extends JpaRepository<Movie, Long> {
	
	
	public List<Movie> findAll();

	
	
}
