package com.xy.entity;

import java.util.Map;

public class Admin {
	private int a_id;
	/**
	 * 管理员的名字
	 */
	private String a_name;
	/**
	 * 管理员的用户名
	 */
	private String a_username;
	/**
	 * 管理员的登录密码
	 */
	private String a_password;
	/**
	 * 管理员的电话号码
	 */
	private String a_phone;
	/**
	 * 管理员的邮箱地址
	 */
	private String a_email;
	/**
	 * 授权时间即创建时间
	 */
	/**
	 * 管理员拥有的权限
	 */
	private String a_authority;
	/**
	 *创建时间 
	 */
	private String a_createtime;
	private String a_photo;//备用字段1
	private String a_backup2;//备用字段2
	private String a_backup3;//备用字段3
	private String a_backup4;//备用字段4
	private int a_backup5;//备用字段5
	
	
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_username() {
		return a_username;
	}
	public void setA_username(String a_username) {
		this.a_username = a_username;
	}
	public String getA_password() {
		return a_password;
	}
	public void setA_password(String a_password) {
		this.a_password = a_password;
	}
	public String getA_phone() {
		return a_phone;
	}
	public void setA_phone(String a_phone) {
		this.a_phone = a_phone;
	}
	public String getA_email() {
		return a_email;
	}
	public void setA_email(String a_email) {
		this.a_email = a_email;
	}
	public String getA_createtime() {
		return a_createtime;
	}
	public void setA_createtime(String a_createtime) {
		this.a_createtime = a_createtime;
	}
	public String getA_authority() {
		return a_authority;
	}
	public void setA_authority(String a_authority) {
		this.a_authority = a_authority;
	}
	public String getA_photo() {
		return a_photo;
	}
	public void setA_photo(String a_photo) {
		this.a_photo = a_photo;
	}
    
}
