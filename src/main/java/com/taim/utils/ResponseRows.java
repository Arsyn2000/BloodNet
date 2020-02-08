package com.taim.utils;

import java.io.Serializable;

public class ResponseRows implements Serializable {

	private static final long serialVersionUID = 1L;
	private String originalRecordNumber;
	private String sku;
	private String errorCode;
	private String errorType;
	private String errorMessage;
	public String getOriginalRecordNumber() {
		return originalRecordNumber;
	}
	public void setOriginalRecordNumber(String originalRecordNumber) {
		this.originalRecordNumber = originalRecordNumber;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getErrorType() {
		return errorType;
	}
	public void setErrorType(String errorType) {
		this.errorType = errorType;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
}
