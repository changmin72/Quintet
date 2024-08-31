package com.smhrd.entity;
import java.sql.Timestamp;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Entity
@Data
@Table(name = "member")
public class Member {
	
	@Id
	private String email;
	private String password; 
	private String nickname; 
	private String gender;
	private String birthdate; 
	private Timestamp joindate;
	private Integer level;
}
