package com.xy.dao;

import java.util.List;
/**
 * 账单管理模块包括详单
 * @author soonsmile
 *
 */
import java.util.Map;

import com.xy.entity.Bill;
import com.xy.entity.BillDetail;
public interface BillDao {
	/**
	 * 查询所有账单信息
	 * @return
	 */
	public List <BillDetail> billSelectAllDao(Map map);
	/**
	 * 统计所有账单记录
	 * @return
	 */
	public int selectAllCountDao();
 
	/**
	 * 通过b_id 查询详单表所有信息
	 * @param  
	 * @param b_id
	 * @return
	 */
	public List selectBillDetailDao(Map map);
	/**
	 * 统计所有详单记录
	 * @return
	 */
	public int selectDetailCountDao(Map map);
	
	
	
}
