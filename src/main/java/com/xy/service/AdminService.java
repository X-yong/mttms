package com.xy.service;

import java.util.List;
import java.util.Map;

import com.xy.entity.Admin;

public interface AdminService {
	/**
	 * 用户登陆
	 * @param admin
	 * @return
	 */
	public Admin loginService(Admin admin);
	/**
	 * 查询所有管理员信息
	 * @param admin
	 * @return
	 */
	public List<Admin> searchAdminInfoService(Admin admin) ;
	/**
	 * 增加管理员
	 * @return
	 */
	public int insertAdminService(Admin admin);
	/**
	 *查询此管理员账号是否存在 
	 * @param admin
	 * @return
	 */
	public Admin selectExitAdminService(Admin admin);
	/**
	 * 删除管理员
	 * @param admin
	 * @return
	 */
	public int deleteAdminService(Admin admin);
	/**
	 * 修改管理员信息，使用a_id作为条件
	 * @param admin
	 * @return
	 */
	public int updateAdminService(Admin admin);
	/**
	 * 查询某一个管理员的信息
	 * @param admin
	 * @return
	 */
	public Admin selectByaidService(Admin admin);
	/**
	 * 修改密码
	 * @param map
	 * @return
	 */
	public int updatePasswordService(Map map);
	/**
	 * 修改用户信息
	 * @param admin
	 * @return
	 */
	public int updateInfoService(Admin admin);
	/**
	 * 密码重置
	 * @param list
	 * @return
	 */
	public int restPswsService(List list);
	/**
	 * 将汉字权限转换为数字
	 * @param admin
	 */
	public void service(Admin admin);
	/**
	 *将数字权限转换成汉字
	 * @param admin
	 * @return
	 */
	public Admin nService(Admin admin) ;
}			  
