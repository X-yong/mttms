package com.xy.dao;

import java.util.List;
import java.util.Map;

import com.xy.entity.Admin;

public interface AdminDao {
	/**
	 * 用户登陆,个人信息查询
	 * @return
	 */
	public Admin loginDao(Admin admin);
	/**
	 * 查询所有管理员信息
	 * @return
	 */
	public List<Admin> searchAdminInfoDao(Admin admin);
    /**
     * 增加管理员
     * @return
     */
	public int insertAdminDao(Admin admin);
	/**
	 * 删除管理员
	 * @param admin
	 * @return
	 */
	public int deleteAdminDao(Admin admin);
	/**
	 * 修改管理员信息 使用a_id 作为条件
	 * @param admin
	 * @return
	 */
	public int updateAdminDao(Admin admin);
	/**
	 * 查询某一个管理员的信息
	 * @param admin
	 * @return
	 */
	public Admin selectByaidDao(Admin admin);
	/**
	 * 修改个人信息
	 * @param admin
	 * @return
	 */
	public int updateInfoDao(Admin admin);
	/**
	 * 修改密码
	 */ 
	public int updatePasswordDao(Map map); 
	/**
	 * 重置密码
	 * @param list
	 * @return
	 */
	public int restPswsDao(List list);
	/**
	 * 查询此管理员账号是否存在
	 * @param admin
	 * @return
	 */
	public Admin selectExitAdminDao(Admin admin);
} 
