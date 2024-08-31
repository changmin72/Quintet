package com.smhrd.socket;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;

@Controller
public class ChartController {

    private static List<String> labels;
    private static List<Integer> counts;
    
   

    public static void setChartData(List<String> label, List<Integer> count) {
        labels = label;
        counts = count;
    }
    @GetMapping("/showChart")
    public String showChart(HttpSession session) {
        try {
            // ObjectMapper를 사용하여 JSON 형식으로 변환
            ObjectMapper objectMapper = new ObjectMapper();
            String labelsJson = objectMapper.writeValueAsString(labels);
            String countsJson = objectMapper.writeValueAsString(counts);
            
            // 변환된 JSON 데이터를 모델에 추가
            session.setAttribute("labelsJson", labelsJson);
            session.setAttribute("countsJson", countsJson);
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "searchAnalysis"; // chart.jsp로 포워딩
    }
}
