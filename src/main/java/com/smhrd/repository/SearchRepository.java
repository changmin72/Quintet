package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.EmotionData;
import com.smhrd.entity.Search;

@Repository
public interface SearchRepository extends JpaRepository<Search, Integer> {
	
	public List<Search> findByEmail(String email);
	
	
	public Search findByResultid(Integer resultid);
	

	
	
	

}
