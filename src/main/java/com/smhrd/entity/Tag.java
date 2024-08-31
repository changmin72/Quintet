package com.smhrd.entity;

import java.sql.Timestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "tag")
public class Tag {
	@Id
	private Integer moviecode;
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
