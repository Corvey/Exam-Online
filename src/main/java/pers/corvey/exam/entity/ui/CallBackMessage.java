package pers.corvey.exam.entity.ui;

import pers.corvey.exam.util.CurrentUtils;

/**
 * 回调消息
 * @author Corvey
 * 对应bootstrap里的alert
 */
public class CallBackMessage {

	public static final String MESSAGE_ATTRIBUTE_NAME = "message";
	
	private String cssClass;
	private String type;
	private String text;
	
	private CallBackMessage(String type, String text, String cssClass) {
		setType(type);
		setText(text);
		setCssClass(cssClass);
	}
	
	public static CallBackMessage createSuccessMsg(String text) {
		return new CallBackMessage("success", text, "alert-success");
	}
	
	public static CallBackMessage createWarningMsg(String text) {
		return new CallBackMessage("failure", text, "alert-warning");
	}
	
	public static CallBackMessage createDangerMsg(String text) {
		return new CallBackMessage("failure", text, "alert-danger");
	}

	/**
	 * 根据某个方法执行的结果返回消息
	 * @param function 要执行的方法
	 * @param successMessage 方法执行成功后返回的消息
	 * @param failureMessage 方法执行失败后返回的消息
	 * @return
	 */
	public static CallBackMessage createMsgAfterFunction(
			Runnable function, String successMessage, String failureMessage) {
		
		CallBackMessage msg;
		try {
			function.run();
			msg = CallBackMessage.createSuccessMsg(successMessage);
		} catch (Exception e) {
			e.printStackTrace();
			msg = CallBackMessage.createDangerMsg(failureMessage);
		}
		return msg;
	}
	
	public void addToCurrentSession() {
		CurrentUtils.addAttributeToSession(MESSAGE_ATTRIBUTE_NAME, this);
	}
	
	public void addToCurrentRequest() {
		CurrentUtils.addAttributeToRequest(MESSAGE_ATTRIBUTE_NAME, this);
	}
	
	public String getCssClass() {
		return cssClass;
	}

	private void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
