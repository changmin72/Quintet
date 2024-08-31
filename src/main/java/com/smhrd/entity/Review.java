package com.smhrd.entity;

import java.sql.Timestamp;
import java.util.Date;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Entity
@Data
@Table(name = "review")
public class Review {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reviewid; 
	
	@Column(name = "moviecode")
	private Integer moviecode; 
	
	@Column(name = "email")
	private String email;
	
	
	
	private String content;
	private Integer fear; 
	private Integer joy;  
	private Integer surprise; 
	private Integer sadness;  
	private Integer boredom;  
	private Integer pain;  
	private Integer disgust;  
	private Integer interest;  
	private Integer disappointment; 

}
