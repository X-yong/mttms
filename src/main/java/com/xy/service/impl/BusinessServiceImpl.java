package com.xy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.xy.dao.BusinessDao;
import com.xy.entity.Business;
import com.xy.entity.Customer;
import com.xy.service.BusinessService;
@Service("businessService")
public class BusinessServiceImpl implements BusinessService {
	@Resource
	private BusinessDao businessDao;
	/**
	 *  提供给Customer的接口，通过c_id删除业务账号
	 */
	public int updateBusinessByCidService(Customer customer){
		
		return businessDao.updateBusinessByCidDao(customer);
	}
	/**
	 * 查询所有业务信息
	 */
	public Map<String, Object> selectBusinessAllService(Map map) {
		List<Business> result = businessDao.selectBusinessAllDao(map);
		int count = businessDao.selectAllcountDao();
		System.out.println("总记录数"+count);
		Map<String, Object> map2 = new HashMap<String,Object>();
		map2.put("total", count);
		map2.put("rows", result);
		return map2;
	}
	/**
	 * 通过c_id查询
	 */
	public Business selectBusinessBycidService(int c_id) {
		
		return businessDao.selectBusinessBycidDao(c_id);
	}
	/**
	 * 增加信息
	 */
	public int insertBusinessService(Map map) {
		
		return businessDao.insertBusinessDao(map);
	}
	/**
	 * 修改信息
	 */
	public int updateBusinessByBidService(int b_id,String b_state) {
		Map map = new HashMap();
		map.put("b_state", b_state);
		map.put("b_id", b_id);
		return businessDao.updateBusinessByBidDao(map);
	}
	/**
	 * 删除信息使用bid
	 */
	public int deleteBusinessByBidService(int b_id) {
		
		return businessDao.deleteBusinessByBidDao(b_id);
	}
	public int updateBusinessInfoService(Map map) {
		
		return businessDao.updateBusinessInfoDao(map);
	}
   /**
    *查询信息使用bid 	
    */
	public Business selectAllBybidService(int b_id) {
	
		return businessDao.selectAllBybidDao(b_id);
	}
	/**
	 * 外部接口，通过c_id暂停业务账号
	 */
    public int operateBycidService(int c_id) {
	
	return businessDao.operateBycidDao(c_id);
}
	
}
