package com.attrition.prediction.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TRADE_FORECAST_TBL")
public class EmployeeAttritionPrediction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -295030127952852241L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int tradeId;

	@Column
	private String tradeDate;

	@Column
	private String company;
	
	@Column
	private String status;

	@Column
	private String cpm;
	
	@Column
	private String orderType;
	
	@Column
	private String buySellValue;
	
	@Column
	private String targetValue;
	
	@Column
	private String stopLossValue;
	
	@Column
	private String profitLossValue;
	
	@Column
	private String result;

	@Column
	private String tradeResultDate;
	
	@Column
	private String comments;

	public int getTradeId() {
		return tradeId;
	}

	public void setTradeId(int tradeId) {
		this.tradeId = tradeId;
	}

	public String getTradeDate() {
		return tradeDate;
	}

	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCpm() {
		return cpm;
	}

	public void setCpm(String cpm) {
		this.cpm = cpm;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getBuySellValue() {
		return buySellValue;
	}

	public void setBuySellValue(String buySellValue) {
		this.buySellValue = buySellValue;
	}

	public String getTargetValue() {
		return targetValue;
	}

	public void setTargetValue(String targetValue) {
		this.targetValue = targetValue;
	}

	public String getStopLossValue() {
		return stopLossValue;
	}

	public void setStopLossValue(String stopLossValue) {
		this.stopLossValue = stopLossValue;
	}

	public String getProfitLossValue() {
		return profitLossValue;
	}

	public void setProfitLossValue(String profitLossValue) {
		this.profitLossValue = profitLossValue;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getTradeResultDate() {
		return tradeResultDate;
	}

	public void setTradeResultDate(String tradeResultDate) {
		this.tradeResultDate = tradeResultDate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}