package com.smhrd.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name="search")
public class Search {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer resultid;
	
	@Column(name = "email")
	private String email;
	
	private String movietitle;
	private Integer fear;
	private Integer joy;
	private Integer surprise;
	private Integer sadness;
	private Integer boredom;
	private Integer pain;
	private Integer disgust;

}
