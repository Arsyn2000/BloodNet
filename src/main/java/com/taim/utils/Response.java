package com.taim.utils;

import java.io.Serializable;
import java.util.ArrayList;

public class Response implements Serializable  {

	private static final long serialVersionUID = 1L;
	private String processed;
	private String successful;
	private ArrayList<ResponseRows> responseRows;
	public String getProcessed() {
		return processed;
	}
	public void setProcessed(String processed) {
		this.processed = processed;
	}
	public String getSuccessful() {
		return successful;
	}
	public void setSuccessful(String successful) {
		this.successful = successful;
	}
	public ArrayList<ResponseRows> getResponseRows() {
		return responseRows;
	}
	public void setResponseRows(ArrayList<ResponseRows> responseRows) {
		this.responseRows = responseRows;
	}
	
}
