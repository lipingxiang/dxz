package com.dxz.model;

import java.util.Date;

public class S2sconfig {
	
	private long  id;
	private int enable;
	private int serverType;
	private String code;
	private String acode;
	private String websocketURL;
	private String httpURL;
	private int gsid;
	private int roomHeader;
	private int passiveMode;
	private Date createTime;
	private String sdesc;
	private long matchhistoryid;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getServerType() {
		return serverType;
	}
	public void setServerType(int serverType) {
		this.serverType = serverType;
	}
	public String getWebsocketURL() {
		return websocketURL;
	}
	public void setWebsocketURL(String websocketURL) {
		this.websocketURL = websocketURL;
	}
	public String getHttpURL() {
		return httpURL;
	}
	public void setHttpURL(String httpURL) {
		this.httpURL = httpURL;
	}
	public int getRoomHeader() {
		return roomHeader;
	}
	public void setRoomHeader(int roomHeader) {
		this.roomHeader = roomHeader;
	}
	public int getPassiveMode() {
		return passiveMode;
	}
	public void setPassiveMode(int passiveMode) {
		this.passiveMode = passiveMode;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAcode() {
		return acode;
	}
	public void setAcode(String acode) {
		this.acode = acode;
	}
	public int getGsid() {
		return gsid;
	}
	public void setGsid(int gsid) {
		this.gsid = gsid;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public String getSdesc() {
		return sdesc;
	}
	public void setSdesc(String sdesc) {
		this.sdesc = sdesc;
	}
	public long getMatchhistoryid() {
		return matchhistoryid;
	}
	public void setMatchhistoryid(long matchhistoryid) {
		this.matchhistoryid = matchhistoryid;
	}
	
	


}
