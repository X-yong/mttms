package com.xy.service.impl;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.w3c.dom.ls.LSInput;

import com.xy.dao.BillDao;
import com.xy.service.BillService;

@Service("billservice")
public class BillServiceImpl implements BillService {
		@Resource 
		private BillDao billDao;
		
	/**
	 * 查询所有账单信息
	 */
	public Map billSelectAllService(Map map) {
		Map< String, Object> map2  = new HashMap<String, Object>();
		List aList = billDao.billSelectAllDao(map);
		System.out.println(aList);
		int count = billDao.selectAllCountDao();
		map2.put("total", count);
		map2.put("rows", aList);
		return map2;
	}
    //查询详单信息
	public Map selectBillDetailService(int b_id,String yearmonth) {
		Map map = new HashMap<String ,Object>();
		List dList = billDao.selectBillDetailDao(b_id,yearmonth);
		int  count = billDao.selectDetailCountDao();
		map.put("total", count);
		map.put("rows", dList);
		return map;
		
		
	}

}
