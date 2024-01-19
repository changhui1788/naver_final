package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = "config")
@ComponentScan(basePackages = "upload")
@ComponentScan(basePackages = "board.spring.mybatis")
@ComponentScan(basePackages = "websocket")

@MapperScan(basePackages = "board.spring.mybatis")

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}
	
}
