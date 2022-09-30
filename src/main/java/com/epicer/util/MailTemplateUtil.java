package com.epicer.util;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.epicer.model.users.User;

import freemarker.template.Template;


@Service
public class MailTemplateUtil {
	
	@Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    public void sendMessageWithFreemarkerTemplate(String tempName,User user) {
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper mailsender = new MimeMessageHelper(message, true,"UTF-8");

            mailsender.setTo(user.getAccount());
            mailsender.setSubject("Hello!"+" "+user.getName()+" "+"Welcome to join Epicer!!!!");

            HashMap<String, Object> models = new HashMap<>();
            models.put("name","freemarker");
            models.put("user",user);
//            Context context = new Context();
//            context.setVariable("user",user);
            Template template = freeMarkerConfigurer.getConfiguration().getTemplate(tempName);
            String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, models);
            
            mailsender.setText(text,true);
            javaMailSender.send(message);
            System.out.println("sucess!");
        } catch (Exception ex) {
        	System.out.println("出示了阿北");
        }
    }
}
