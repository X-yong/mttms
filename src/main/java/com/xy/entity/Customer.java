package com.xy.entity;
import java.util.List;
/**
 * customer表的字段，get/set方法
 * @author
 *
 */
public class Customer {
	private int c_id; //客户的id
	private String c_name;	//客户的的名字
	private String c_idcard;	//客户的身份证号
	private String c_username;	//客户的财务账号
	private String c_password;	//客户的登录密码
	private String c_phone;		//客户的手机号码
	private String c_otherid;	//客户的推荐人身份证号码
	private String c_email;		//客户的邮箱地址
	private String c_work;		//客户的工作
	private String c_sex;		//客户的性别
	private String c_address;	//客户的地址
	private String c_postcode;	//客户的邮编
	private String c_qq="";		    //客户的QQ号码
	private String c_createtime;	//客户的信息创建时间
	private String c_onlinetime;	//客户的上次登录时间
	private String c_state ;     //客户账户的状态
	private String c_opentime ;     //开通时间
	private String c_stoptime ;     //暂停时间
	private String c_deletetime ;     //删除时间
	private String lastloginip ;     //上次登录ip
	private List<Business> businesses;
    private String c_yearmonth;     //bill年月筛选
	
	public List<Business> getBusinesses() {
		return businesses;
	}
	public void setBusinesses(List<Business> businesses) {
		this.businesses = businesses;
	}
	public String getC_yearmonth() {
		return c_yearmonth;
	}
	public void setC_yearmonth(String c_yearmonth) {
		this.c_yearmonth = c_yearmonth;
	}
	public String getC_opentime() {
		return c_opentime;
	}
	public void setC_opentime(String c_opentime) {
		this.c_opentime = c_opentime;
	}
	
	public String getC_stoptime() {
		return c_stoptime;
	}
	public void setC_stoptime(String c_stoptime) {
		this.c_stoptime = c_stoptime;
	}
	public String getC_deletetime() {
		return c_deletetime;
	}
	public void setC_deletetime(String c_deletetime) {
		this.c_deletetime = c_deletetime;
	}
	public String getLastloginip() {
		return lastloginip;
	}
	public void setLastloginip(String lastloginip) {
		this.lastloginip = lastloginip;
	}
	public String getC_postcode() {
		return c_postcode;
	}
	public void setC_postcode(String c_postcode) {
		this.c_postcode = c_postcode;
	}
	public String getC_qq() {
		return c_qq;
	}
	public void setC_qq(String c_qq) {
		this.c_qq = c_qq;
	}
	public String getC_createtime() {
		return c_createtime;
	}
	public void setC_createtime(String c_createtime) {
		this.c_createtime = c_createtime;
	}
	public String getC_onlinetime() {
		return c_onlinetime;
	}
	public void setC_onlinetime(String c_onlinetime) {
		this.c_onlinetime = c_onlinetime;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_idcard() {
		return c_idcard;
	}
	public void setC_idcard(String c_idcard) {
		this.c_idcard = c_idcard;
	}
	public String getC_username() {
		return c_username;
	}
	public void setC_username(String c_username) {
		this.c_username = c_username;
	}
	public String getC_password() {
		return c_password;
	}
	public void setC_password(String c_password) {
		this.c_password = c_password;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_otherid() {
		return c_otherid;
	}
	public void setC_otherid(String c_otherid) {
		this.c_otherid = c_otherid;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_work() {
		return c_work;
	}
	public void setC_work(String c_work) {
		this.c_work = c_work;
	}
	public String getC_sex() {
		return c_sex;
	}
	public void setC_sex(String c_sex) {
		this.c_sex = c_sex;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public String getC_state() {
		return c_state;
	}
	public void setC_state(String c_state) {
		this.c_state = c_state;
	}
	public Customer() {
		super();
	}

}
