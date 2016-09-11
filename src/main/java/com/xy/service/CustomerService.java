package com.xy.service;

import java.util.List;

import com.xy.entity.Customer;

public interface CustomerService {
	/**
	 * 查询所有财务账号信息
	 * @return
	 */
	public List<Customer> selectAllCustomerService();
	/**
	 * 增加财务账号
	 * @return
	 */
	public int insertCustomer(Customer customer);
	/**
	 * 通过身份证号码查询该财务账号是否存在
	 * @param customer
	 * @return
	 */
	public Customer selectCustomerByIdcard(Customer customer);
	/**
	 * 条件查询
	 * @param customer
	 * @return
	 */
	public List<Customer> selectCustomerByConditionService(Customer customer);
	/**
	 * 暂停开通操作
	 * @return
	 */
	public int operateStopService(Customer customer);
	/**
	 * 查询每个财务账号详细信息，通过c_id
	 * @param customer
	 * @return
	 */
	public Customer detailSelectService(Customer customer);
	/**
	 * 通过推荐人的身份证号查c_id
	 * @param customer
	 * @return
	 */
	public Customer selectByOtherIdService(Customer customer);
	/**
	 * 删除账务账号（假删除）
	 * @param customer
	 * @return
	 */
	public int deleteCustomerService(Customer customer );
	
	/**
	 * 修改账务账号信息
	 * @param customer
	 * @return
	 */
	public int updateCustomerService(Customer customer);
	/**
	 * 通过身份证号码查c_id
	 * @param c_idcard
	 * @return
	 */
	public Customer selectCustomerByidcardService(String c_idcard);
}
