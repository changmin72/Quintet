package com.smhrd.repository;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.smhrd.entity.Tag;

@Repository
public interface TagRepository extends JpaRepository<Tag, Integer> {
	
	public List<Tag> findMoviecodeByFear(int fear);
	public List<Tag> findMoviecodeByJoy(int joy);
	public List<Tag> findMoviecodeBySurprise(int surprise);
	public List<Tag> findMoviecodeBySadness(int sadness);
	public List<Tag> findMoviecodeByBoredom(int boredom);
	public List<Tag> findMoviecodeByPain(int pain);
	public List<Tag> findMoviecodeByDisgust(int disgust);
	public List<Tag> findMoviecodeByInterest(int interest);
	public List<Tag> findMoviecodeByDisappointment(int disappointment);

}
