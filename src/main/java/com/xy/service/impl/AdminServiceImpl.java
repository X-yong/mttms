package com.xy.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xy.dao.AdminDao;
import com.xy.entity.Admin;
import com.xy.service.AdminService;
import com.xy.util.ChangeAuthority;
import com.xy.util.CreateTime;
@Service("adminService")

public class AdminServiceImpl implements AdminService{
	@Resource
	private AdminDao adminDao;
	/**
	 * 用户登陆
	 */
	public Admin loginService(Admin admin) {
		System.out.println("用户登陆接口");
		return adminDao.loginDao(admin);
	}
	/**
	 * 修改用户信息
	 */
	public int updateInfoService(Admin admin){
		ChangeAuthority changeAuthority = new ChangeAuthority();
		String string = changeAuthority.changAuthority(admin.getA_authority());
		admin.setA_authority(string);
		return adminDao.updateInfoDao(admin);	
	}
	/**
	 * 修改密码
	 */
	public int updatePasswordService(Map map) {
	
		return adminDao.updatePasswordDao(map);
	}
	/**
	 * 查询所有管理员信息
	 */
	public List<Admin> searchAdminInfoService(Admin admin) {
		System.out.println("查询管理员信息Service层");
		ChangeAuthority changeAuthority = new ChangeAuthority();
		String authority = admin.getA_authority();
		if("全部".equals(authority))
		{
			admin.setA_authority("");
		}else if(admin.getA_authority() != null ){
			
			String a_authority = changeAuthority.changAuthority(admin.getA_authority());
			admin.setA_authority(a_authority);
		}
		 List<Admin> result = adminDao.searchAdminInfoDao(admin);//查询结果	
		 for(int i=0;i<result.size();i++){
			 Admin rAdmin = result.get(i);
			 String a_authority = changeAuthority.nChangAuthority(rAdmin.getA_authority());
				rAdmin.setA_authority(a_authority);
		 }
		return result ;
	}
	/**
	 * 增加管理员
	 */
	public int insertAdminService(Admin admin) {
		ChangeAuthority changeAuthority = new ChangeAuthority();
		CreateTime createTime = new CreateTime();
		String a_authority = changeAuthority.changAuthority(admin.getA_authority());
		String a_createtime = createTime.createtime();
		admin.setA_authority(a_authority);
		admin.setA_createtime(a_createtime);
		return adminDao.insertAdminDao(admin);
	}
	/**
	 * 删除管理员信息
	 */
	public int deleteAdminService(Admin admin) {
		
		return adminDao.deleteAdminDao(admin);
	}
	/**
	 * 修改管理员信息
	 */
	public int updateAdminService(Admin admin) {
		//将权限（文字表示）转换成数字表示
		/*ChangeAuthority changeAuthority = new ChangeAuthority();
		String a_authority = changeAuthority.changAuthority(admin.getA_authority());
		admin.setA_authority(a_authority);*/
		service(admin);
		return adminDao.updateAdminDao(admin);
	}
	public void service(Admin admin){
		//将权限（文字表示）转换成数字表示
		ChangeAuthority changeAuthority = new ChangeAuthority();
		String a_authority = changeAuthority.changAuthority(admin.getA_authority());
		admin.setA_authority(a_authority);
	}
	public Admin nService(Admin uadmin){
		//将权限（数字表示）转换成文字表示
		if(uadmin !=null){
		ChangeAuthority changeAuthority = new ChangeAuthority();
		String a_authority = changeAuthority.nChangAuthority(uadmin.getA_authority());
		uadmin.setA_authority(a_authority);
		}
		return uadmin;
	}
	/**
	 * 密码重置
	 */
	public int restPswsService(List list) {
		System.out.println("密码重置Service！");
		return adminDao.restPswsDao(list);
	}
	/**
	 * 查询某一个管理员的信息
	 */
	public Admin selectByaidService(Admin admin) {
		
		return adminDao.selectByaidDao(admin);
	}
	public Admin selectExitAdminService(Admin admin) {
		
		return adminDao.selectExitAdminDao(admin);
	}
	
	
}
