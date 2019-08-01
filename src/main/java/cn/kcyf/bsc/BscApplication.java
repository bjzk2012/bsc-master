package cn.kcyf.bsc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class BscApplication {
    public static void main(String[] args) {
        SpringApplication.run(BscApplication.class, args);
    }
}
