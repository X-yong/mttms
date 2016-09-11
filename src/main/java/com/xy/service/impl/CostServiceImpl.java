package com.xy.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xy.dao.CostDao;
import com.xy.entity.Admin;
import com.xy.entity.Cost;
import com.xy.service.CostService;
@Service("costService")
public class CostServiceImpl implements CostService {
	@Resource
	private CostDao costDao;
	
	/**
	 * 增加资费
	 */
	public int insertCostService(Cost cost) {
		return costDao.insertCostDao(cost);
	}
	/**
	 * 修改资费
	 */
	public int updateCostService(Cost cost) {
	
		return costDao.updateCostDao(cost);
	}
	/**
	 * 删除资费
	 */
	public int deleteCostService(Cost cost) {
		
		return costDao.deleteCostDao(cost);
	}
	/**
	 * 查找所有资费
	 */
	public List<Cost> selectCostService() {
		
		return costDao.selectCostDao();
	}
	/**
	 * 将资费按照条件排序
	 */
	public List<Cost> orderCostService(Map map) {
		
		return costDao.orderCostDao(map);
	}
	/**
	 * 使用cost_id查询某一条资费
	 */
	public Cost selectCostServiceById(Cost cost) {
		
		return  costDao.selectCostByIdDao(cost);
	}
	/**
	 * 使用cost_name查询某一条资费是否已存在
	 */
	public Cost selectCostServiceByName(String cost_name) {
		
		return  costDao.selectCostByNameDao(cost_name);
	}
	/**
	 * 启用资费
	 */
	public int startCost(Cost cost) {

		return costDao.startCostDao( cost);
	}
	/**
	 *外部接口，查询出所有开通的资费名称
	 * @return
	 */
	public List selectAllCostService() {
		
		return costDao.selectAllCostDao();
	}
	
	
}
