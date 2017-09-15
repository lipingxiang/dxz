package com.dxz.model;

import java.util.Date;

public class PaymentChannel {
	
	private int channelid;
	private String chname;
	private int os;
	private int enable;
	private String feeurl;
	private Date createtime;
	
	
	public int getChannelid() {
		return channelid;
	}
	public void setChannelid(int channelid) {
		this.channelid = channelid;
	}
	public String getChname() {
		return chname;
	}
	public void setChname(String chname) {
		this.chname = chname;
	}
	public int getOs() {
		return os;
	}
	public void setOs(int os) {
		this.os = os;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public String getFeeurl() {
		return feeurl;
	}
	public void setFeeurl(String feeurl) {
		this.feeurl = feeurl;
	}
	
	public Date getCreatetime() {
		return createtime;
	}
	
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
}
