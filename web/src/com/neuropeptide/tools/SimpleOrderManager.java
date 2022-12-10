package com.neuropeptide.tools;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:04
 * @Description:
 */
public class SimpleOrderManager implements OrderManager {
    PropertiesFactoryHelper propeties = PropertiesFactoryHelper.getInstance();
    private MailSender mailSender;
    private SimpleMailMessage simpleMailMessage;

    public SimpleOrderManager() {
    }

    public MailSender getMailSender() {
        return this.mailSender;
    }

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    public SimpleMailMessage getSimpleMailMessage() {
        return this.simpleMailMessage;
    }

    public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
        this.simpleMailMessage = simpleMailMessage;
    }

    public void placeOrder() {
        SimpleMailMessage simpleMailMessage1 = new SimpleMailMessage(this.simpleMailMessage);
        simpleMailMessage1.setTo(this.propeties.getConfig("admin.email"));
        simpleMailMessage1.setSubject("submission of neuropeptide data");
        simpleMailMessage1.setText("you have received a new submission of neuropeptide data, please check it as soon as possible!");

        try {
            this.mailSender.send(simpleMailMessage1);
        } catch (MailException var3) {
            System.out.println(var3.getMessage());
        }

    }
}