package com.xy.service;

import java.util.Map;

import com.xy.entity.Business;
import com.xy.entity.Customer;

public interface BusinessService {
	/**
	 * 提供给Customer的接口，通过c_id删除业务账号(假删除)
	 * @param customer
	 * @return
	 */
	public int updateBusinessByCidService(Customer customer);
	/**
	 * 提供给Customer的接口，通过c_id暂停业务账号
	 * @param int
	 * @return
	 */
	public int operateBycidService(int c_id);
	/**
	 * 查询所有信息
	 * @param business
	 * @return
	 */
	public Map<String ,Object>selectBusinessAllService(Map map);
	/**
	 * 通过c_id查询业务账号是否存在
	 * @param c_id
	 * @return
	 */
	public Business selectBusinessBycidService(int c_id);
	/**
	 * 增加业务账号
	 * @param map
	 * @return
	 */
	public int insertBusinessService(Map map);
	/**
	 * 开通或暂停操作
	 * @param b_id
	 * @return
	 */
	public  int updateBusinessByBidService(int b_id,String b_state);
	/**
	 * 删除操作
	 * @param b_id
	 * @return
	 */
	public int deleteBusinessByBidService(int b_id);
	/**
	 * 修改操作
	 * @param b_id
	 * @return
	 */
	public int updateBusinessInfoService(Map map);
	/**
	 * 通过b_id查询账务账号
	 * @param b_id
	 * @return
	 */
	public Business selectAllBybidService(int b_id);
	
}
