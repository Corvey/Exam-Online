package pers.corvey.exam.other.security;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

public class CaptchaUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter{  
    
    public static final String SPRING_SECURITY_FORM_CAPTCHA_KEY = "captcha";
    
    private String captchaParameter = SPRING_SECURITY_FORM_CAPTCHA_KEY;
    
    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, 
    		HttpServletResponse response) throws AuthenticationException {
    	System.out.println("---------------------captcha filter");
    	HttpSession session = request.getSession();
    	String captcha = (String) session.getAttribute(captchaParameter);
    	if (captcha == null) {
    		throw new CaptchaException("验证码已失效，请重试！");
    	}
    	session.removeAttribute(captchaParameter);
    	String inputCaptcha = request.getParameter(captchaParameter);
    	if (inputCaptcha == null || !Objects.equals(captcha.toLowerCase(), inputCaptcha.toLowerCase())) {
    		throw new CaptchaException("输入验证码有误，请重试！");
    	}
		return super.attemptAuthentication(request, response);
    }
}  