package team.project.gday.common.scheduling;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import team.project.gday.calendar.model.vo.Calendar;


public class SendSMSbyN {
	
	private String hostNameUrl = "https://sens.apigw.ntruss.com";
	private String requestUrl = "/sms/v2/services/";
	private String requestUrlType = "/messages";
	private String accessKey = "nefpEDnwBEqP2C7r033R"; //네이버 플랫폼 인증키
	private String secretKey = "jAMScTDPGgnKAeAVUj8i3i5d8RHrxaxTw1ZOeTny"; //네이버 플랫폼 시크릿키 → \
	//private String secretKey = "86194957564c45df8d60592b90335aac"; //네이버 플랫폼 시크릿키 → \
	private String serviceId = "ncp:sms:kr:264254118022:gday2"; //네이버 플랫폼 콘솔 → 프로젝트 생성시 부여되는 id
	private String method = "POST"; 
	private String timestamp = Long.toString(System.currentTimeMillis()); //current timestamp(epoch)	

	
	//매개변수로 메시지 보낼 기념일이 담긴 List<Calendar> targetList와 남은 날짜(int leftDay) 받기
	public int sendSMS (List<Calendar> targetList) {
		
		requestUrl += serviceId + requestUrlType; 
		String apiUrl = hostNameUrl + requestUrl;//최종 url
		
		//Json을 활용하여 body data 생성 (문자메시지 보낼 때 필수로 있어야하는 json)
		//type(LMS/SMS-80byte), contentType(COMM) 일반, countryCode(82), from(01064793835), 
		// (subject(공통제목)), content(공통내용)
		// + scheduleCode(every-am-10) : 스케줄시간
		//bodyJson.addProperty("scheduleCode", "every-am-10");//스케줄링 사용시
		JsonObject bodyJson = new JsonObject();
		bodyJson.addProperty("type", "LMS");//연습용 실제 적용 LMS(2000byte)
		bodyJson.addProperty("contentType", "COMM");
		bodyJson.addProperty("countyCode", "82");
		bodyJson.addProperty("from", "01064793835"); //사전에 등록된 번호만 가능(네이버 플랫폼)
		bodyJson.addProperty("subject", "Gday 알림!");//공통 제목 LMS 사용 시
		bodyJson.addProperty("content", "Gday 알림!");//공통 내용
		
		
		//Json을 활용하여 message to(받는 사람) + content(to 번호에만 따로 보낼 내용 내용) + (subject(to 번호에만 따로 보낼 제목)
		JsonArray msgArr = new JsonArray();//msgJson을 담을 배열 → 담아서 bodyJson에 추가함
		
		for( Calendar target : targetList ) {
			
			int leftDay = target.getGdayNo();//gdayNo에 임시로 leftday(남은 날 담아옴)
			
			JsonObject msgJson = new JsonObject();
			msgJson.addProperty("to", target.getMemberPhone());//받는 사람의 target.getMemberPhone() (혜윤)
		
			String tSubject = "HELLO! GDAY!\n";
			
			String tContent = target.getGdayTitle() + " D-" + leftDay + "!\n" + target.getMemberNick() + "님의 '" + target.getGdayTitle() + "'이/가 ";
			 
			if(leftDay == 0) {
				tContent += "오늘입니다!\n마음을 담은 선물을 전하고 상대방에게 Good-day를 만들어 주세요!:D";
			} else if(leftDay <= 7) { 
				tContent += "얼마 남지 않았어요!\n선물을 준비하셨나요?\n아직 준비하지 않았다면 지금 바로 GDAY에서 선물을 준비하세요!XD"; 
			} else { 
				tContent += "다가옵니다.\n선물을 준비하셨나요?\n미리 선물을 준비해 '"
								+ target.getGdayTitle() + "'을/를 Good-day를 만들어 보세요!^O^"; }
			
			msgJson.addProperty("subject", "[GDAY]" + tSubject);
			msgJson.addProperty("content", tSubject+tContent);//tContent
			
			msgArr.add(msgJson);
			System.out.println("msgArr : " + msgArr);

			bodyJson.add("messages", msgArr);//message를 보낼 대상과 메시지 내용을 담은 배열 넣기
		}
		//for문 끝

//		for(int i=0; i<2; i++) {
//		JsonObject msgJson = new JsonObject();
//
//		msgJson.addProperty("to", "01064793835");
//		msgJson.addProperty("content", (i+1) + "번");
//		msgArr.add(msgJson);
//		} 여러개 문자 한번에 발송 확인용

		bodyJson.add("messages", msgArr);//message를 보낼 대상과 메시지 내용을 담은 배열 넣기
		
		String body = bodyJson.toString();
		System.out.println("bodyJson : " + bodyJson);
		System.out.println("body : " + body);
		
		int responseCode = 0;//문자발송 확인용
		
		try {
			
			URL url = new URL(apiUrl);
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			
			System.out.println("con1 : " + con);
			
			con.setUseCaches(false);
			
			// 컨트롤 캐쉬 설정
			//con.setRequestProperty("Cache-Control","no-cache");
			 
			// 타입길이 설정(Request Body 전달시 Data Type의 길이를 정함.)
			//con.setRequestProperty("Content-Length", "length");
			
			con.setDoOutput(true);
			con.setDoInput(true);
			// TimeOut 시간 (서버 접속시 연결 시간)
			con.setConnectTimeout(60 * 1000);
			 
			// TimeOut 시간 (Read시 연결 시간)
			con.setReadTimeout(60 * 1000);
			
			con.setRequestProperty("Content-Type", "application/json; charset=utf-8");//; charset=utf-8
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			//con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
			
			con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature());
			
			//con.setRequestProperty("Accept", "application/json");
			
			System.out.println("accessKey: " + accessKey);
			System.out.println("secretKey: " + secretKey);
			System.out.println("makeSignature() : " + makeSignature());
			
			con.setRequestMethod(method);
			con.setDoOutput(true);

			System.out.println("output : "+ con.getOutputStream());
			
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			//OutputStream wr = con.getOutputStream();
			
			byte[] input = body.getBytes("UTF-8");
			wr.write(input, 0, input.length);
			
			//wr.write(body.getBytes("UTF-8"));
			wr.flush();
			wr.close();
			
			responseCode = con.getResponseCode();
			
			
			BufferedReader br; //scanner와 유사
			System.out.println("responseCode : " + responseCode);
			
			if(responseCode == 202) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { //에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println("발송 결과 : " + response.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return responseCode;//202면 발송 성공
	}
	
	
	public String makeSignature() throws Exception{
		String space = " ";					// one space
		String newLine = "\n";					// new line

		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(requestUrl)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();

		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
		mac.init(signingKey);

		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		String encodeBase64String = Base64.encodeBase64String(rawHmac);

	  return encodeBase64String;
	}

	
}
