package pers.corvey.exam.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import pers.corvey.exam.entity.sys.SysUser;

public class CurrentUtils {

	public static SysUser getCurrentUser() {
		Object obj = SecurityContextHolder.getContext()
				.getAuthentication()
			    .getPrincipal();
		if (!(obj instanceof SysUser)) {
			return null;
		}
		SysUser user = (SysUser) obj;
		return user;
	}
	
	public static HttpServletRequest getCurrentRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		return request;
	}
	
	public static HttpServletResponse getCurrentResponse() {
		HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getResponse();
		return response;
	}
	
	public static HttpSession getCurrentSession() {
		return getCurrentRequest().getSession();
	}
	
	public static void addAttributeToRequest(String name, Object obj) {
		HttpServletRequest request = getCurrentRequest();
		request.setAttribute(name, obj);
	}
	
	public static void addAttributeToSession(String name, Object obj) {
		HttpSession session = getCurrentSession();
		session.setAttribute(name, obj);
	}
}
