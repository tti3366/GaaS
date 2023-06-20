package service;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import model.Reply;
import model.User;

public class EmailSender {
    public void emailSend(User postOwner, Reply reply) {
        // 이메일 송신에 필요한 정보 설정
        String host = "smtp.naver.com"; // SMTP 서버 호스트
        String port = "587"; // SMTP 서버 포트
        String username = "simjoon00@naver.com"; // 송신자 이메일 계정
        String password = "ghkd!th12"; // 송신자 이메일 계정의 비밀번호

        // 이메일 송신 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        //props.put("mail.smtp.ssl.trust", "stmp.naver.com");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        // 세션 생성 및 인증
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // 메시지 생성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username)); // 송신자 설정
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(postOwner.getUserEmail())); // 수신자 설정
            message.setSubject("FHAK 알림"); // 이메일 제목
            message.setText(postOwner.getUserName() + "님의 " + reply.getPostId() + "번 게시글에 댓글이 달렸습니다"); // 이메일 내용

            // 이메일 전송
            Transport.send(message);

            System.out.println("Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
