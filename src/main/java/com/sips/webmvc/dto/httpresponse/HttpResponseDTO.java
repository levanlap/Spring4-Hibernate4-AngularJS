package com.sips.webmvc.dto.httpresponse;

public class HttpResponseDTO {
	
	public static String SUCCESS = "SUCCESS";
	public static String ERROR = "ERROR";
	
	private String status;
	private Object data;
	private String message; // Incase error
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
