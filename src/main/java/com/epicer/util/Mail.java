package com.epicer.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class Mail {
	
 @Autowired
 JavaMailSender mailSender;
 
 public void sendToGmail() {
  SimpleMailMessage message = new SimpleMailMessage();  
  
  message.setTo("eeit4902@gmail.com");
  message.setSubject("測試透過 Gmail 去發信");
  message.setText("org.springframework.mail.SimpleMailMessage 透過 Gmail 發信。");
  
  mailSender.send(message);
 }
}
