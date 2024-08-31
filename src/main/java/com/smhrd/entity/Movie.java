package com.smhrd.entity;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Entity
@Data
@Table(name = "movie")
public class Movie {

	@Id
	private Long moviecode;
	private String moviename;
	private Date releasedate;
	private String rating;
	private String genre;
	private String runningtime;
	private String distributor;
	private String director;
	private String plot;
	private String imgurl;
	
	
}
