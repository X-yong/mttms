package com.xy.dao;

import java.util.List;

import com.xy.entity.Customer;

public interface CustomerDao {
	/**
	 * 添加账务账号
	 * @return
	 */
	public int insertCustomerDao(Customer customer);
	/**
	 * 修改账务信息
	 * @return
	 */
	public int updateCustomerDao(Customer customer);
	/**
	 * 查询所有账务账号信息
	 * @return
	 */
	public List<Customer> selectAllCustomerDao();
	/**
	 * 通过身份证号码查询账务账号是否存在
	 * @param customer
	 * @return
	 */
	public Customer selectCustomerByIdcard(Customer customer);
	/**
	 *条件查询
	 * @param customer
	 * @return
	 */
	public List<Customer> selectCustomerByConditionDao(Customer customer);
	/**
	 * 暂停开通操作
	 * @return
	 */
	public int operateStopDao(Customer customer);
	/**
	 * 查询详单，通过c_id
	 * @param customer
	 * @return
	 */
	public Customer detailSelectDao(Customer customer);
	/**
	 * 通过推荐人身份证号查c_id
	 * @param customer
	 * @return
	 */
	public Customer selectByOtherId(Customer customer);
	/**
	 * 删除账务账号
	 * @return
	 */
	public int deleteCustomerDao(Customer customer);
	/**
	 * 通过c_id查询
	 * @param c_id
	 * @return
	 */
	public Customer selectCustomerDaoByCid(int c_id);
	/**
	 * 通过身份证号码查询c_id
	 * @param C_idcard
	 * @return
	 */
	public Customer selectCustomerByidcardDao(String C_idcard);
}
