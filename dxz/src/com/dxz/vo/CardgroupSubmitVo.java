package com.dxz.vo;

import java.util.List;

public class CardgroupSubmitVo {
	
	private String clientId;
	
	private String code;
	
	private List<CardgroupData> cardgroups;
	
	private String sdesc;
	
	private int enable;

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<CardgroupData> getCardgroups() {
		return cardgroups;
	}

	public void setCardgroups(List<CardgroupData> cardgroups) {
		this.cardgroups = cardgroups;
	}


	public String getSdesc() {
		return sdesc;
	}

	public void setSdesc(String sdesc) {
		this.sdesc = sdesc;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}





}
