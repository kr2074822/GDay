package team.project.gday.common.scheduling;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


public class SendSMSbyN {
	
	private String hostNameUrl = "https://sens.apigw.ntruss.com";
	private String requestUrl = "/sms/v2/services/";
	private String requestUrlType = "/messages";
	private String accessKey = "nefpEDnwBEqP2C7r033R"; //네이버 플랫폼 인증키
	private String secretKey = "jAMScTDPGgnKAeAVUj8i3i5d8RHrxaxTw1ZOeTny"; //네이버 플랫폼 시크릿키 → \
	private String serviceId = "ncp:sms:kr:264254118022:gday2"; //네이버 플랫폼 콘솔 → 프로젝트 생성시 부여되는 id
	private String method = "POST"; 
	private String timestamp = Long.toString(System.currentTimeMillis()); //current timestamp(epoch)	

	
	//매개변수로 메시지 보낼 기념일이 담긴 List<Calendar> targetList와 남은 날짜(int leftDay) 받기
	public void sendSMS () {
		
		requestUrl += serviceId + requestUrlType; 
		String apiUrl = hostNameUrl + requestUrl;//최종 url
		

		//Json을 활용하여 message to(받는 사람) + content(to 번호에만 따로 보낼 내용 내용) + (subject(to 번호에만 따로 보낼 제목)
		JsonObject msgJson = new JsonObject();
		JsonArray msgArr = new JsonArray();//msgJson을 담을 배열 → 담아서 bodyJson에 추가함
		
		//향상 for( Calendar target : targetList )
		msgJson.addProperty("to", "01027730241");//받는 사람의 target.getMemberPhone() (혜윤)
		
		/*String tSubject = target.getGdayTitle + "D-" + leftDay + "!"
		
		String tContent = target.getMemberNick() + "님의 " + target.getGdayTitle + "가 ";
		
		if(leftDay <= 7) {
			tContent += "얼마 남지 않았어요! 선물을 준비하셨나요? 아직 준비하지 않았다면 지금 바로 선물을 준비하세요!";
		} else {
			tContent += "다가옵니다. 미리 선물을 준비해 " + target.getGdayTitle + "을/를 Good-day를 만들어 보세요!";
		}*/
		
		//msgJson.addProperty("subject", tSubject);
		msgJson.addProperty("content", "문자 발송 테스트"); //tContent
		
		msgArr.add(msgJson);
		
		System.out.println("msgArr : " + msgArr);
		
		//for문 끝
		
		//Json을 활용하여 body data 생성 (문자메시지 보낼 때 필수로 있어야하는 json)
		//type(LMS/SMS-80byte), contentType(COMM) 일반, countryCode(82), from(01064793835), 
		// (subject(공통제목)), content(공통내용)
		// + scheduleCode(every-am-10) : 스케줄시간
		JsonObject bodyJson = new JsonObject();

		bodyJson.addProperty("type", "SMS");//연습용 실제 적용 LMS(2000byte)
		bodyJson.addProperty("contentType", "COMM");
		bodyJson.addProperty("countyCode", "82");
		bodyJson.addProperty("from", "01064793835"); //사전에 등록된 번호만 가능(네이버 플랫폼)
		//bodyJson.addProperty("subject", "Hello! Gday!");//공통 제목 LMS 사용 시
		bodyJson.addProperty("content", "왜안돼??");//공통 내용
		//bodyJson.addProperty("scheduleCode", "every-am-10");//스케줄링 사용시
		bodyJson.add("messages", msgArr);//message를 보낼 대상과 메시지 내용을 담은 배열 넣기
		
		String body = bodyJson.toString();
		System.out.println("bodyJson : " + body);
		
		try {
			
			URL url = new URL(apiUrl);
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			
			System.out.println("con1 : " + con);
			
			con.setUseCaches(false);
			
			// 컨트롤 캐쉬 설정
			con.setRequestProperty("Cache-Control","no-cache");
			 
			// 타입길이 설정(Request Body 전달시 Data Type의 길이를 정함.)
			//con.setRequestProperty("Content-Length", "length");
			
			con.setDoOutput(true);
			con.setDoInput(true);
			// TimeOut 시간 (서버 접속시 연결 시간)
			con.setConnectTimeout(60 * 1000);
			 
			// TimeOut 시간 (Read시 연결 시간)
			con.setReadTimeout(60 * 1000);
			
			con.setRequestProperty("content-type", "application/json; charset=utf-8");//; charset=utf-8
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			//con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
			con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(apiUrl));
			System.out.println("accessKey: " + accessKey);
			System.out.println("secretKey: " + secretKey);
			System.out.println("makeSignature(apiUrl) : " + makeSignature(apiUrl));
			
			con.setRequestMethod(method);
			con.setDoOutput(true);

			System.out.println("con2 : " + con);
			
			System.out.println(con.getOutputStream());
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			
			wr.write(body.getBytes("UTF-8"));
			wr.flush();
			wr.close();
			
			int responseCode = con.getResponseCode();
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
		
	}
	
	
	/*
	private static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws Exception {
		String space = " "; // one space
		String newLine = "\n"; // new line
																								// string)
		String message = new StringBuilder()
				.append(method)
				.append(space)
				.append(url)
				.append(newLine)
				.append(timestamp)
				.append(newLine)
				.append(accessKey).toString();

		SecretKeySpec signingKey;
		String encodeBase64String;
		
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);

			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.encodeBase64String(rawHmac);
			
		return encodeBase64String;
	}*/
	
	public String makeSignature(String apiUrl) throws Exception{
		String space = " ";					// one space
		String newLine = "\n";					// new line

		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(apiUrl)
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
