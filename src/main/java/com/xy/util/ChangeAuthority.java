package com.xy.util;

import org.springframework.stereotype.Service;

@Service("changAuthority")
public class ChangeAuthority {
	/**
	 * 将汉字权限转换为数字式
	 * @param s
	 * @return
	 */
	public String changAuthority( String s){
		System.out.println("要转换的字符串："+s);
		StringBuffer ss = new StringBuffer();
		if(s.indexOf("角色管理") !=-1)
		ss.append("1");
		if(s.indexOf("管理员管理") !=-1)
			ss.append("2");
		if(s.indexOf("资费管理") !=-1)
			ss.append("3");
		if(s.indexOf("账务管理") !=-1)
			ss.append("4");
		if(s.indexOf("业务管理") !=-1)
			ss.append("5");
		if(s.indexOf("账单管理") !=-1)
			ss.append("6");
		if(s.indexOf("报表管理") !=-1)
			ss.append("7");
		System.out.println("转换后的值："+ss.toString());
		return ss.toString();
	}
	/**
	 * 将数字式权限转换为汉字式显示
	 */
	public String nChangAuthority( String s){
		System.out.println("要转换的字符串2："+s);
		StringBuffer ss = new StringBuffer();
		if(s.indexOf("1") !=-1)
		ss.append(" 角色管理");
		if(s.indexOf("2") !=-1)
			ss.append(" 管理员管理");
		if(s.indexOf("3") !=-1)
			ss.append(" 资费管理");
		if(s.indexOf("4") !=-1)
			ss.append(" 账务管理");
		if(s.indexOf("5") !=-1)
			ss.append(" 业务管理");
		if(s.indexOf("6") !=-1)
			ss.append(" 账单管理");
		if(s.indexOf("7") !=-1)
			ss.append(" 报表管理");
		System.out.println("转换后的值："+ss.toString());
		return ss.toString();
	}
}
