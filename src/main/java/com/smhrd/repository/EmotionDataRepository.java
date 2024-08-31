package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.EmotionData;

@Repository
public interface EmotionDataRepository extends JpaRepository<EmotionData , Long> {
    // 추가적인 쿼리 메서드가 필요한 경우 정의할 수 있습니다.
	
	public List<EmotionData> findByEmail(String email);
	public EmotionData findByFaceresultid(int faceresultid);
	
}