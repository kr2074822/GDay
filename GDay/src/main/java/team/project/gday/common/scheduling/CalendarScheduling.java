package team.project.gday.common.scheduling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import team.project.gday.calendar.model.service.CalendarService;

@Component
public class CalendarScheduling {
	/* Spring Scheduling ( Scheduler )
	 * -스프링에서 제공하는 스케줄러로서 지정된 시간 또는 특정 간격마다 작업(job)을 진행하도록 하는 기능
	 * 
	 * 사용 조건
	 * (1) dispatcher servlet(servlet-context.xml) 파일에 
	 * 	task namespace를 추가 
	 *  → 이후 <task:annotation-driven/> 추가
	 *  <task:annotation-driver/> : 스케줄러 관련 어노테이션 활성화
	 *  
	 * (2) 작업이 작성된 클래스를 Bean으로 등록
	 * -bean 등록 : 스프링 컨테이너가 제어 가능(IOC)
	 * 
	 *  *bean 등록 어노테이션 : @Controller, @Service, @Repository, @Component(세 가지를 아우르는)
	 *  → @Component를 스케줄링.java에 작성
	 *  
	 * (3) 지정된 작업이 기록된 메소드를 작성 + @Scheduled 어노테이션
	 * *@Scheduled 어노테이션 속성
	 * -fixedDelay : 이전 작업이 끝난 시점부터 고정된 시간(ms)만큼 지난 후 수행
	 * -fixedRate : 이전 작업이 시작된 시점으로부터 고정된 시간(ms)만큼 지난 후 수행
	 * -cron : UNIX 계열 잡 스케줄러 표현식. 시간을 지정 가능.
	 *	cron = "초 분 시 일 월 요일 [년도]"
	 *	요일 : 일요일(1) 월(2) 화(3) 수(4) 목(5) 금(6) 토(7) 
	 *	ex) 2021년 2월 18일 목요일 10시 20분 30초 → cron = "30 20 10 18 2 5 2021"
	 *	
	 *	-특수 문자
	 *	* : 모든 수
	 *	ex) 매년 2월 18일 10시 20분 30초 → cron = "30 20 10 18 2 * [*]" //년도 생략 가능
	 *	ex) 매일 자정(0시) → cron = "0 0 0 * * *"
	 *
	 *	- : 두 수 사이의 값 
	 *	ex) 10-15 : 10이상 15이하
	 *
	 *	, : 특정 값 지정
	 *	ex) 3,4,7 : 3,4,7  지정
	 *
	 *	/ : 값의 증가.
	 *	ex) 0/5 : 0부터 시작해서 5씩 증가할 때마다
	 *
	 *	? : 특별한 값이 없음(월, 요일만 해당)
	 * 
	 *  L : 마지막 (월, 요일만 해당 / 일은 안 됨)
	 */
	
	@Autowired
	private CalendarService calService;
	
	
	//매일 8시에 기념일 보내기
	@Scheduled(cron="0 0 10 * * *") //매일 오전 10시에 발송 0 0 10 * * *
	public void sendGdayMsg() {
		
	}
	
	//캘린더 리스트 가져와서 모든 기념일 계산
	//주기로 조건걸어서 기념일 계산(DB는 최초 등록일만 저장되어 있음)
	
	//계산한 기념일 -30 -7 당일에 문자 보내기
	
	

	
	
}
