package com.smhrd.entity;




import java.sql.Timestamp;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table (name="faceanalysis")
public class EmotionData {
    
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long faceresultid;
    private String email;
    private Double fear;
    private Double happy;
    private Double surprise;
    private Double sad;
    private Double disgust;
    private Double neutral;
    private Double angry;
    
    
    @Column(insertable = false,updatable = false)
    private Timestamp analysistime;

}
