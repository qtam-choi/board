package kr.co.olivar.board;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ProjectApplication {

    public static void main(String[] args) {

        System.setProperty("spring.config.name", "application");

        SpringApplication.run(ProjectApplication.class, args);
        System.out.println("========Spring Boot Started==========" );

    }
}
