package com.neuropeptide.tools;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:00
 * @Description:
 */
public class JavaMail {
    private MimeMessage mimeMsg;
    private Session session;
    private Properties props;
    private boolean needAuth = false;
    private String username = "";
    private String password = "";
    private Multipart mp;

    public JavaMail(String smtp) {
        this.setSmtpHost(smtp);
        this.createMimeMessage();
    }

    public void setSmtpHost(String hostName) {
        if (this.props == null) {
            this.props = System.getProperties();
        }

        this.props.put("mail.smtp.host", hostName);
    }

    public boolean createMimeMessage() {
        try {
            this.session = Session.getDefaultInstance(this.props, (Authenticator) null);
        } catch (Exception var3) {
            return false;
        }

        try {
            this.mimeMsg = new MimeMessage(this.session);
            this.mp = new MimeMultipart();
            return true;
        } catch (Exception var2) {
            return false;
        }
    }

    public void setNeedAuth(boolean need) {
        if (this.props == null) {
            this.props = System.getProperties();
        }

        if (need) {
            this.props.put("mail.smtp.auth", "true");
        } else {
            this.props.put("mail.smtp.auth", "false");
        }

    }

    public void setNamePass(String name, String pass) {
        this.username = name;
        this.password = pass;
    }

    public boolean setSubject(String mailSubject) {
        try {
            this.mimeMsg.setSubject(mailSubject);
            return true;
        } catch (Exception var3) {
            return false;
        }
    }

    public boolean setBody(String mailBody) {
        try {
            BodyPart bp = new MimeBodyPart();
            bp.setContent("<meta http-equiv=Content-Type content=text/html; charset=gb2312>" + mailBody, "text/html;charset=UTF-8");
            this.mp.addBodyPart(bp);
            return true;
        } catch (Exception var3) {
            return false;
        }
    }

    public boolean addFileAffix(String filename) {
        try {
            BodyPart bp = new MimeBodyPart();
            FileDataSource fileds = new FileDataSource(filename);
            bp.setDataHandler(new DataHandler(fileds));
            bp.setFileName(fileds.getName());
            this.mp.addBodyPart(bp);
            return true;
        } catch (Exception var4) {
            return false;
        }
    }

    public boolean setFrom(String from) {
        try {
            this.mimeMsg.setFrom(new InternetAddress(from));
            return true;
        } catch (Exception var3) {
            return false;
        }
    }

    public boolean setTo(String to) {
        if (to == null) {
            return false;
        } else {
            try {
                this.mimeMsg.setRecipients(RecipientType.TO, InternetAddress.parse(to));
                return true;
            } catch (Exception var3) {
                return false;
            }
        }
    }

    public boolean setCopyTo(String copyto) {
        if (copyto == null) {
            return false;
        } else {
            try {
                this.mimeMsg.setRecipients(RecipientType.CC, InternetAddress.parse(copyto));
                return true;
            } catch (Exception var3) {
                return false;
            }
        }
    }

    public boolean sendout() {
        try {
            this.mimeMsg.setContent(this.mp);
            this.mimeMsg.saveChanges();
            Session mailSession = Session.getInstance(this.props, (Authenticator) null);
            Transport transport = mailSession.getTransport("smtp");
            transport.connect((String) this.props.get("mail.smtp.host"), this.username, this.password);
            transport.sendMessage(this.mimeMsg, this.mimeMsg.getRecipients(RecipientType.TO));
            transport.close();
            return true;
        } catch (Exception var3) {
            var3.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) throws Exception {
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("ApplicationContext.xml");
        SimpleOrderManager simpleOrderManager = (SimpleOrderManager) beanFactory.getBean("orderManager");
        simpleOrderManager.placeOrder();
    }
}
