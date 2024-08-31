package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.entity.EmotionData;
import com.smhrd.repository.EmotionDataRepository;

@Service
public class EmotionDataService {

    @Autowired
    private EmotionDataRepository emotionDataRepository;

    public void saveEmotionData(String email, Double happy, Double sad, Double angry, Double fear, Double surprise, Double disgust, Double neutral) {
        EmotionData emotionData = new EmotionData();
        emotionData.setEmail(email);
        emotionData.setHappy(happy);
        emotionData.setSad(sad);
        emotionData.setAngry(angry);
        emotionData.setFear(fear);
        emotionData.setSurprise(surprise);
        emotionData.setDisgust(disgust);
        emotionData.setNeutral(neutral);
        emotionDataRepository.save(emotionData);
    }
}
