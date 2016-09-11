package com.xy.entity;

public class BillDetail {
	private int d_id;          //详单表id
	private int b_id;          //业务id
	private int cost_id;       //资费id
	private String loginIp;    //客户登陆IP
	private String logintime;  //登录时间
	private String loginouttime; //登出时间
	private int d_money;       //费用
	private int duration;      //使用时长
	private Cost cost;         //cost的对象
	private Business business; //business的对象
	
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getCost_id() {
		return cost_id;
	}
	public void setCost_id(int cost_id) {
		this.cost_id = cost_id;
	}
	public String getLogintime() {
		return logintime;
	}
	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}
	
	public int getD_money() {
		return d_money;
	}
	public void setD_money(int d_money) {
		this.d_money = d_money;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public Cost getCost() {
		return cost;
	}
	public void setCost(Cost cost) {
		this.cost = cost;
	}
	public Business getBusiness() {
		return business;
	}
	public void setBusiness(Business business) {
		this.business = business;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public String getLoginouttime() {
		return loginouttime;
	}
	public void setLoginouttime(String loginouttime) {
		this.loginouttime = loginouttime;
	}
	
}
