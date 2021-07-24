package com.care.root.scheduler;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class MyScheduler {
	//@Scheduled(cron = "*/10 * * * * *")
	public void testSch() {
		System.out.println("실행");
	}
}







