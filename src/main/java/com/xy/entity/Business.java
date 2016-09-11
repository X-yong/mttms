
package com.xy.entity;

public class Business {
	
	private int b_id; 			// 业务id
	private int c_id; 				// 客户id，c_id为外键，参照的是customer中的c_id
	private String b_osusername;    // 上网os账号
	private String b_ospassword;    // 上网密码
	private String b_state; 		// 状态
	private int cost_id; 			// 资费id，cost_id为外键，参照的是cost中的cost_id
	private String b_createtime;
	private String b_deletetime;
	private String b_stoptime;
	private Cost cost;
	private Customer customer;
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getB_osusername() {
		return b_osusername;
	}
	public void setB_osusername(String b_osusername) {
		this.b_osusername = b_osusername;
	}
	public String getB_ospassword() {
		return b_ospassword;
	}
	public void setB_ospassword(String b_ospassword) {
		this.b_ospassword = b_ospassword;
	}
	public String getB_state() {
		return b_state;
	}
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public int getCost_id() {
		return cost_id;
	}
	public void setCost_id(int cost_id) {
		this.cost_id = cost_id;
	}
	public String getB_createtime() {
		return b_createtime;
	}
	public void setB_createtime(String b_createtime) {
		this.b_createtime = b_createtime;
	}
	public String getB_deletetime() {
		return b_deletetime;
	}
	public void setB_deletetime(String b_deletetime) {
		this.b_deletetime = b_deletetime;
	}
	public Cost getCost() {
		return cost;
	}
	public void setCost(Cost cost) {
		this.cost = cost;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getB_stoptime() {
		return b_stoptime;
	}
	public void setB_stoptime(String b_stoptime) {
		this.b_stoptime = b_stoptime;
	}

	
}
