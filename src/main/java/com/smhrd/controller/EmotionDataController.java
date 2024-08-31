package com.smhrd.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.entity.EmotionData;
import com.smhrd.entity.Search;
import com.smhrd.repository.EmotionDataRepository;
import com.smhrd.repository.SearchRepository;

@Controller
public class EmotionDataController {

    @Autowired
    private EmotionDataService emotionDataService;
    
    @Autowired
    EmotionDataRepository repo;
    
    @Autowired
    SearchRepository searchrepo;

    @PostMapping("/saveEmotionData")
    public String saveEmotionData(@RequestBody Map<String, Object> emotionDataMap) {
        String email = (String) emotionDataMap.get("email");
        
        // 각 감정 데이터를 Double로 안전하게 캐스팅하는 부분
        Double happy = convertToDouble(emotionDataMap.get("happy"));
        Double sad = convertToDouble(emotionDataMap.get("sad"));
        Double angry = convertToDouble(emotionDataMap.get("angry"));
        Double fear = convertToDouble(emotionDataMap.get("fear"));
        Double surprise = convertToDouble(emotionDataMap.get("surprise"));
        Double disgust = convertToDouble(emotionDataMap.get("disgust"));
        Double neutral = convertToDouble(emotionDataMap.get("neutral"));

        // 서비스 호출하여 데이터 저장
        emotionDataService.saveEmotionData(email, happy, sad, angry, fear, surprise, disgust, neutral);

        return "전송성공";
    }

    private Double convertToDouble(Object value) {
        if (value instanceof Integer) {
            return ((Integer) value).doubleValue();
        } else if (value instanceof Double) {
            return (Double) value;
        } else if (value instanceof String) {
            return Double.parseDouble((String) value);
        }
        return 0.0; // 기본값으로 0.0을 반환
    }
    
    
    @RequestMapping("/faceResult1")
    public String goFaceAnalysis(String email, Model model) {
		
    	List<EmotionData> emotion =repo.findByEmail(email);
    	model.addAttribute("emotion", emotion);
    	
     return "faceResult";	
    }
    
    @RequestMapping("/faceAnalysis2")
    public String goFaceAnalysis2(int faceresultid, Model model) {
    	EmotionData emotion = repo.findByFaceresultid(faceresultid);
    	model.addAttribute("emotion2", emotion);
    	return "faceAnalysis2";
    }
    
    
    @RequestMapping("/searchResult1")
    public String goSearchAnalysis(String email, Model model) {
		
    	List<Search> search = searchrepo.findByEmail(email);
    	model.addAttribute("search", search);
    	System.out.println("서치"+search.get(0).getMovietitle());
    	
     return "searchResult";	
    }
    
}
