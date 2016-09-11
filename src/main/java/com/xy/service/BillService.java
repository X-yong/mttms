package com.xy.service;

import java.util.Map;
public interface BillService {
	/**
	 * 查询所有信息
	 * @param map
	 * @return
	 */
	public Map billSelectAllService(Map map); 
	/**
	 * 通过b_id 查询出详单对应信息
	 * @param b_id
	 * @return
	 */
	public Map selectBillDetailService(int b_id ,String yearmonth);
}
