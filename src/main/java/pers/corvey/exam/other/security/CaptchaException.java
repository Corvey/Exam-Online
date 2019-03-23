package pers.corvey.exam.other.security;

import org.springframework.security.core.AuthenticationException;

public class CaptchaException extends AuthenticationException {

	private static final long serialVersionUID = 3974591721255959567L;

	public CaptchaException(String msg, Throwable t) {
		super(msg, t);
	}

	public CaptchaException(String msg) {
		super(msg);
	}

}
