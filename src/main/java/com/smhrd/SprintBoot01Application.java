package com.smhrd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SprintBoot01Application {

	
	// @SpringBootApplication의 역할
	// 1. @ComponentScan
	// 특정한 패키지를 스캔해서, "특별한 클래스"들을 Bean으로 등록하는 과정
	// 자동으로 Application.java 파일이 있는 패키지를 자동으로 스캔
	// com.smhrd.controller
	// com
	//	  ㄴsmhrd
	// 			ㄴSpringBoot01Application.java
	//			ㄴcontroller
	// 								이러한 과정 때문에 첫 패키지를 생성할 때, group id 까지만 생성
	//								앞으로 만드는 모든 패키지는 group id를 반드시 붙여야 함.
	
	//	2. @AutoConfiguration
	// 		(1) Spring이 시작하기 위한 필요한 설정들을 자동으로 진행
	//			json으로 어떤 bean을 생성해야 하고, 변수를 무슨 값으로 채워야 하는지
	// 			미리 정의 --> SpringBoot가 해당 파일을 읽고 필요한 bean을 생성
	//		(2) 만약 개발자가 특정 값으로 바꾸고 싶은 경우에는
	//			application.properties에서 값을 변경할 수 있음
	// 			json 파이에 정의되어 있는 프로퍼티 이름을 작성하고
	// 			= 값을 통해서 원하는 값을 집어 넣어 주면 된다.
	//		(3) 특정 라이브러리를 추가했을 때,
	// 			해당 라이브러리를 사용하기 위해 필요한 bean 또한 자동으로 생성 
	//			특히 JDBC 관련 라이브러리를 집어넣게 되면
	// 				자동으로 DBCP(DATASOURCE)를 자동으로 만들려고 한다.
	//				해당 bean을 생성하기 위한 정보나 옵션을 정의해주어야 함.
	//				>> applicationproperties에서 설정
	
	
	
	public static void main(String[] args) {
		SpringApplication.run(SprintBoot01Application.class, args);
	}

}
