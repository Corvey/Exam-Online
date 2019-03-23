package pers.corvey.exam.controller.sys;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Objects;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.corvey.exam.util.CaptchaUtils;



@Controller
@RequestMapping("/captcha")
public class CaptchaController {

    public static final String CAPTCHA_ATTRIBUTE_NAME = "captcha";
    
    @GetMapping
    public void createCaptcha(HttpSession session, HttpServletResponse response) {
        String captchaCode = CaptchaUtils.createCaptcha();
        session.setAttribute(CAPTCHA_ATTRIBUTE_NAME, captchaCode);
        
        response.setContentType("image/png");
        response.setHeader("Cache-Control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("expries", -1);
        
        BufferedImage image = CaptchaUtils.createCaptchaImage(captchaCode);
        try {
            ServletOutputStream out = response.getOutputStream();
            ImageIO.write(image, "png", out);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static boolean judge(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String inputCode = request.getParameter(CAPTCHA_ATTRIBUTE_NAME);
    	String correctCode = (String) session.getAttribute(CAPTCHA_ATTRIBUTE_NAME);
    	session.removeAttribute(CAPTCHA_ATTRIBUTE_NAME);
    	if (inputCode == null || correctCode == null) {
    		return false;
    	}
    	return Objects.equals(inputCode.toLowerCase(), correctCode.toLowerCase());
    }
}
