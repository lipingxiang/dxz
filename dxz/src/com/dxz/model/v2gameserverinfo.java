package com.dxz.model;

import java.util.Date;

public class v2gameserverinfo {
	
	private long id;
	private String cscode;
	private int gameid;
	private int enable;
	private String websocketURL;
	private int port;
	private int roomLimit;
	private int idHeader;
	private String vipRoomHeaderList;
	private String roomactionURL;
	private Date createTime;
	private String gameserviceip;
	private int groupid;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCscode() {
		return cscode;
	}
	public void setCscode(String cscode) {
		this.cscode = cscode;
	}
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public String getWebsocketURL() {
		return websocketURL;
	}
	public void setWebsocketURL(String websocketURL) {
		this.websocketURL = websocketURL;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public int getRoomLimit() {
		return roomLimit;
	}
	public void setRoomLimit(int roomLimit) {
		this.roomLimit = roomLimit;
	}
	public int getIdHeader() {
		return idHeader;
	}
	public void setIdHeader(int idHeader) {
		this.idHeader = idHeader;
	}
	
	public String getVipRoomHeaderList() {
		return vipRoomHeaderList;
	}
	public void setVipRoomHeaderList(String vipRoomHeaderList) {
		this.vipRoomHeaderList = vipRoomHeaderList;
	}
	public String getRoomactionURL() {
		return roomactionURL;
	}
	public void setRoomactionURL(String roomactionURL) {
		this.roomactionURL = roomactionURL;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getGameserviceip() {
		return gameserviceip;
	}
	public void setGameserviceip(String gameserviceip) {
		this.gameserviceip = gameserviceip;
	}
	public int getGroupid() {
		return groupid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}

	


}
