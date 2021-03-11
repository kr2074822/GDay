package team.project.gday.calendar.model.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.calendar.model.dao.CalendarDAO;
import team.project.gday.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDAO dao;
	
	//캘린더 기념일 조회
	@Override
	public List<Calendar> selectCalendarList(int memberNo) {
		return dao.selectCalendarList(memberNo);
	}

	
	//캘린더 기념일 상세 조회
	@Override
	public Calendar viewEvent(int gdayNo) {
		return dao.viewEvent(gdayNo);
	}

	
	//캘린더 기념일 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertEvent(Calendar event) {
		return dao.insertEvent(event);
	}

	//캘린더 기념일 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateEvent(Calendar event) {
		return dao.updateEvent(event);
	}
	
	//캘린더 기념일 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteEvent(int gdayNo) {
		return dao.deleteEvent(gdayNo);
	}

	
	//----------------------------------------기념일 알림 문자 보내기 관련 메소드----------------------------------------------------
	
	//캘린더 문자 알림용 db기념일 가져오기 - 스케줄링용
	@Override
	public List<Calendar> getTargetList() {
		int memberNo = 0;//임시 버튼과 같이 쓰기 때문에 memberNo 보내려고 0으로 조작
		
		List<Calendar> cList = dao.getOriginList(memberNo);
		
		List<Calendar> targetList = makeTargetList(cList);
		
		if (targetList.isEmpty()) {
			targetList = null;
		}
		return targetList;
	}
	
	
	//캘린더 문자 알림용 db기념일 가져오기 - 캘린더 페이지 임시 버튼용
	@Override
	public List<Calendar> getMemTarget(int memberNo) {
		List<Calendar> cList = dao.getOriginList(memberNo);
		List<Calendar> targetList = makeTargetList(cList);
		
		if (targetList.isEmpty()) {
			targetList = null;
		}
		
		return targetList;
	}

	
	
	//cList로 문자 보낼 기념일 걸러내서 리스트 만들기
	@Override
	public List<Calendar> makeTargetList(List<Calendar> cList) {
		
		List<Calendar> targetList = null;
		
		if(cList != null) {
			
			targetList = new ArrayList<Calendar>();
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
			java.util.Calendar utilCal = java.util.Calendar.getInstance();//util의 calendar
			utilCal.setTime(new java.util.Date());
			String today = df.format(utilCal.getTime());
		
			utilCal.add(java.util.Calendar.DATE, 7);//7일
			String today7 = df.format(utilCal.getTime());
			
		
			utilCal.add(java.util.Calendar.DATE, 7);//14일
			String today14 = df.format(utilCal.getTime());
			
		
			utilCal.add(java.util.Calendar.DATE, 16);//30일
			String today30 = df.format(utilCal.getTime());
			java.util.Calendar standardDt = utilCal;//today+30일인 날짜 기준
			
			
			System.out.println("today : " + today);
			System.out.println("today7 : " + today7);
			System.out.println("today14 : " + today14);
			System.out.println("today30 : " + today30);
		
			//해당 기념일이 오늘 날짜의 +30, +7, +14, +0일때 추가
			
			System.out.println("cList : " + cList);
			
			//기념일 저장 
			for(Calendar originalCal : cList){
				
				//System.out.println("originalCal: " + originalCal);
				//공통 : 언제까지? 오늘 기준 40일 후 전까지 계산
				//반복 없음 날짜 계산 필요 없음
						
				String realGday = df.format(originalCal.getDtStart());
			
				if (realGday.equals(today) || realGday.equals(today7) || realGday.equals(today14) || realGday.equals(today30)){
					
					if(realGday.equals(today)) originalCal.setGdayNo(0);//알림용 남은 기간을 gdayNo에 저장
					else if(realGday.equals(today7)) originalCal.setGdayNo(7);//알림용 남은 기간을 gdayNo에 저장
					else if(realGday.equals(today14)) originalCal.setGdayNo(14); //알림용 남은 기간을 gdayNo에 저장
					else if(realGday.equals(today30)) originalCal.setGdayNo(30); //알림용 남은 기간을 gdayNo에 저장
					
					targetList.add(originalCal);
					System.out.println("반복 없음 + 첫날 target : " + targetList);
				}
				
			if(!(originalCal.getGdayFreq().equals("daily") && originalCal.getGdayInter() == 1 )) {

					String startGday = df.format(originalCal.getDtStart());
					//originalCal의 sql.date startday를 string으로

					java.util.Calendar realGdayC = java.util.Calendar.getInstance();//util의 calendar
					
					try {
			            realGdayC.setTime(df.parse(startGday));//String startGday => util.calendar realGdayC
			        } catch(Exception e) {
			            e.printStackTrace();
			        }
					
					String freq = originalCal.getGdayFreq();
					int inter = originalCal.getGdayInter(); //주기
					
					System.out.println("realGdayC : " + realGdayC);
					System.out.println("startGday : " + startGday);
					
					
					while (!(realGdayC.compareTo(standardDt) == 1)) {//realgday util.calendar > util.calendar standardDt(오늘 날짜 +30) 이면 끝남
						
						switch (freq){
							case "daily" : realGdayC.add(java.util.Calendar.DATE, inter); break;
							case "yearly" : realGdayC.add(java.util.Calendar.MONTH, inter); break;
						}
						
						//System.out.println("realGdayC 수정 후 : " + realGdayC);
						
						//gday Calendar
						Calendar target = originalCal;
						
						realGday = df.format(realGdayC.getTime());//현재 계산된 날짜를 realGday 스트링으로 바꿈
						
						if (realGday.equals(today) || realGday.equals(today7) || realGday.equals(today14) || realGday.equals(today30)){
						
							if(realGday.equals(today)) originalCal.setGdayNo(0);//알림용 남은 기간을 gdayNo에 저장
							else if(realGday.equals(today7)) originalCal.setGdayNo(7);//알림용 남은 기간을 gdayNo에 저장
							else if(realGday.equals(today14)) originalCal.setGdayNo(14); //알림용 남은 기간을 gdayNo에 저장
							else if(realGday.equals(today30)) originalCal.setGdayNo(30); //알림용 남은 기간을 gdayNo에 저장
							
							//target.setGdayTitle(originalCal.getGdayTitle());
							target.setDtStart(Date.valueOf(realGday));//String realGday-> sql.date로 변경
							//target.setMemberNick(originalCal.getMemberNick());
							//target.setMemberPhone(originalCal.getMemberPhone());	
							targetList.add(target);
							System.out.println("반복 있음 target : " + targetList);
						}
						//realGday -> util.calendar
					} 
					
				}//else 문 끝 
			
			}//for문 끝
			System.out.println("targetList: "+ targetList);
		}
		return targetList;
	}


	


}
