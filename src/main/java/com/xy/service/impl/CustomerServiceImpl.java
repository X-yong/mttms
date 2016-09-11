package com.xy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xy.dao.CustomerDao;
import com.xy.entity.Customer;
import com.xy.service.CustomerService;
@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
	@Resource
	private CustomerDao customerDao;
	
	/**
	 * 查询所有财务账号信息
	 */
	public List<Customer> selectAllCustomerService() {
		
		return customerDao.selectAllCustomerDao();
	}
	/**
	 * 增加财务账号
	 */
	public int insertCustomer(Customer customer) {
		
		return customerDao.insertCustomerDao(customer);
	}
	/**
	 * 查询该财务账号是否存在
	 */
	public Customer selectCustomerByIdcard(Customer customer) {
		
		return customerDao.selectCustomerByIdcard(customer);
	}
	/**
	 * 条件查询
	 */
	public List<Customer> selectCustomerByConditionService(Customer customer) {
		
		return customerDao.selectCustomerByConditionDao(customer);
	}
	/**
	 * 暂停开通操作
	 */
	public int operateStopService(Customer customer) {
		
		return customerDao.operateStopDao(customer);
	}
	/**
	 * 查询每个财务账号详细信息，通过c_id
	 * @param customer
	 * @return
	 */
	public Customer detailSelectService(Customer customer) {
		
		return customerDao.detailSelectDao(customer);
	}
	/**
	 * 通过推荐人的身份证号查c_id
	 */
	public Customer selectByOtherIdService(Customer customer) {
		
		return customerDao.selectByOtherId(customer);
	}
	/**
	 * 删除财务账号
	 */
	public int deleteCustomerService(Customer customer) {
		
		return customerDao.deleteCustomerDao(customer);
	}
	/**
	 * 修改账务信息
	 */
	public int updateCustomerService(Customer customer) {
		
		return customerDao.updateCustomerDao(customer);
	}
	/**
	 * 通过身份证号码查询c_id
	 */
	public Customer selectCustomerByidcardService(String c_idcard) {
		
		return customerDao.selectCustomerByidcardDao(c_idcard);
	}

}
