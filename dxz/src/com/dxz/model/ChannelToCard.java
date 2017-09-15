package com.dxz.model;

public class ChannelToCard {
	private int channelid;
	private int feegroupid;
	private int os;
	private int audit;
	private int enable;
	private int priority;
	private String clientid;
	private String code;
	
	
	public int getChannelid() {
		return channelid;
	}
	public void setChannelid(int channelid) {
		this.channelid = channelid;
	}
	public int getFeegroupid() {
		return feegroupid;
	}
	public void setFeegroupid(int feegroupid) {
		this.feegroupid = feegroupid;
	}
	public int getOs() {
		return os;
	}
	public void setOs(int os) {
		this.os = os;
	}
	public int getAudit() {
		return audit;
	}
	public void setAudit(int audit) {
		this.audit = audit;
	}
	
	
	public String getClientid() {
		return clientid;
	}
	public void setClientid(String clientid) {
		this.clientid = clientid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}

}
