package com.borajoin.teuching.member.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.borajoin.teuching.member.model.dao.MemberDao;
import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao md;
	
	Member mem = new Member();
	Trainer tra = new Trainer();

	@Autowired
	JavaMailSender mailSender;
	
	// 일반회원 회원가입
	@Override
	public int joinMember(Map<String, Object> commandMap) throws SQLException {
		int res = md.joinMember(commandMap);

		return res;
	}

	// 트레이너 회원가입
	@Override
	public int joinTrainer(Map<String, Object> commandMap) throws SQLException {
		int res = md.joinTrainer(commandMap);

		return res;
	}
	
	// 일반회원 닉네임 중복체크
	@Override
	public int nickChk(String nickname) {
		int res = md.nickChk(nickname);

		return res;
	}

	// 회원가입 이메일 중복체크 Service
	@Override
	public int emailChk(Map<String, Object> data) {
		int res = md.emailChk(data);

		return res;
	}

	// 일반회원 로그인
	@Override
	public Member m_login(Map<String, Object> commandMap) throws SQLException {
		Member res = null;
		res = md.m_login(commandMap);
		return res;
	}

	// 트레이너 로그인
	@Override
	public Trainer t_login(Map<String, Object> commandMap) throws SQLException {
		Trainer res = null;
		res = md.t_login(commandMap);
		return res;
	}

	
	// 메일 발송
	@Override
	public void mailSending(Map<String, Object> commandMap, String mailfor) {

		final String from = "teuching.official@gmail.com"; // 발신자메일 설정
		final String tomail = (String) commandMap.get("email"); // 사용자의 이메일
		final String title = mailTitle(mailfor);
		final String htmlBody = mailBody(commandMap, mailfor);

		mailSender.send(new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws MessagingException {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				message.setFrom(from);
				message.setTo(tomail);
				message.setSubject(title);
				message.setText(htmlBody, true);
			}
		});

	}
	// 메일 제목
	public String mailTitle(String mailfor) {
	
		String title = "";
		if (mailfor.equals("t_join")) {
			title = "트레이너님! 나를 위한 트레이너 매칭, TeuChing과 함께해주셔서 감사합니다!.";
		}else if(mailfor.equals("m_join")) {
			title = "나를 위한 트레이너 매칭, TeuChing 가입을 환영합니다.";
		}else if(mailfor.equals("t_findpw")) {
			title = "안녕하세요 TeuChing 트레이너님! 로그인을 위한 임시 비밀번호를 보내드립니다.";
		}else if(mailfor.equals("m_findpw")) {
			title = "안녕하세요 TeuChing 회원님! 로그인을 위한 임시 비밀번호를 보내드립니다.";
		}
		return title;
	}
	//메일 내용
	public String mailBody(Map<String, Object> commandMap, String mailfor) {

		String htmlBody = "";

		if (mailfor.equals("t_join")) {
			htmlBody = "<form action='" + commandMap.get("urlPath")
					+ "/member/jointrainerimple.do' method='post'><h3>TeuChing 트레이너 회원가입을 환영합니다.</h3>"
					+ "<h4>가입하기 버튼 클릭 시 회원가입이 완료됩니다. 감사합니다.</h4><br>" + "<input type='hidden' value='"
					+ commandMap.get("name") + "' name='name'>" + "<input type='hidden' value='"
					+ commandMap.get("password") + "' name='password'>" + "<input type='hidden' value='"
					+ commandMap.get("email") + "' name='email'>" + "<input type='hidden' value='"
					+ commandMap.get("cell") + "' name='cell'>" + "<input type='hidden' value='"
					+ commandMap.get("gender") + "' name='gender'>" + "<input type='hidden' value='"
					+ commandMap.get("address") + "' name='address'>" + "<input type='hidden' value='"
					+ commandMap.get("address_detail") + "' name='address_detail'>" + "<input type='hidden' value='"
					+ commandMap.get("height") + "' name='height'>" + "<input type='hidden' value='"
					+ commandMap.get("weight") + "' name='weight'>" + "<input type='hidden' value='"
					+ commandMap.get("photo") + "' name='photo'>" + "<input type='hidden' value='"
					+ commandMap.get("career") + "' name='career'>" + "<input type='hidden' value='"
					+ commandMap.get("prefer1") + "' name='prefer1'>" + "<input type='hidden' value='"
					+ commandMap.get("prefer2") + "' name='prefer2'>" + "<input type='hidden' value='"
					+ commandMap.get("prefer3") + "' name='prefer3'>" + "<input type='hidden' value='"
					+ commandMap.get("keyword") + "' name='keyword'>" + "<button type='submit'>가입하기</form>";

		} else if (mailfor.equals("m_join")) {
			htmlBody += "<form action='"+ commandMap.get("urlPath")
					+ "/member/joinmemberimple.do' method='post'><h3>TeuChing 회원가입을 환영합니다.</h3>"
					+ "<h4>가입하기 버튼 클릭 시 회원가입이 완료됩니다. 감사합니다.</h4><br>" + "<input type='hidden' value='"
					+ commandMap.get("nickname") + "' name='nickname'>" + "<input type='hidden' value='"
					+ commandMap.get("password") + "' name='password'>" + "<input type='hidden' value='"
					+ commandMap.get("email") + "' name='email'>" + "<input type='hidden' value='"
					+ commandMap.get("cell") + "' name='cell'>" + "<input type='hidden' value='"
					+ commandMap.get("gender") + "' name='gender'>" + "<input type='hidden' value='"
					+ commandMap.get("address") + "' name='address'>" + "<button type='submit'>가입하기</form>";

		} else if (mailfor.equals("t_findpw")) {
			htmlBody += "<form action='" + commandMap.get("urlPath") + "/index/index.do'>"
					+ "<h3 style='color: blue;'>" + "트레이너님의 임시 비밀번호 입니다.</h3>" + "<p>임시 비밀번호 : "
					+ commandMap.get("password") + "</p><br>" + "<button type='submit'>로그인하러 가기</form>";
		} else if (mailfor.equals("m_findpw")) {
			htmlBody += "<form action='" + commandMap.get("urlPath") + "/index/index.do'>"
					+ "<h3 style='color: blue;'>" + "회원님의 임시 비밀번호 입니다.</h3>" + "<p>임시 비밀번호 : "
					+ commandMap.get("password") + "</p><br>" + "<button type='submit'>로그인하러 가기</form>";
		}

		return htmlBody;
	}
	
	
	
	
	// 비밀번호 변경하기
	@Override
	public int change_pw(Map<String, Object> commandMap) {
		int res = md.update_pw(commandMap);

		return res;
	}

	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
