package com.xy.entity;

public class Bill {
	private int    bill_id;		//账单ID
	private int    b_id;		//业务Id
	private int    c_id;        //客户账号
	private String bill_money;  //费用
	private String pay_way;		//支付方式
	private String pay_state;	//支付状态 
	private String yearmonth;	//年月 
	private String alltime;	    //累计时间 
	private Customer customer;  //客户表的对象
	
	public int getBill_id() {
		return bill_id;
	}
	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getBill_money() {
		return bill_money;
	}
	public void setBill_money(String bill_money) {
		this.bill_money = bill_money;
	}
	public String getPay_way() {
		return pay_way;
	}
	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}
	public String getPay_state() {
		return pay_state;
	}
	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}
	public String getYearmonth() {
		return yearmonth;
	}
	public void setYearmonth(String yearmonth) {
		this.yearmonth = yearmonth;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getAlltime() {
		return alltime;
	}
	public void setAlltime(String alltime) {
		this.alltime = alltime;
	}
	
	
}
