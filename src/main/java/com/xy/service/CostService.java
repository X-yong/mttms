package com.xy.service;

import java.util.List;
import java.util.Map;

import com.xy.entity.Admin;
import com.xy.entity.Cost;

public interface CostService {
	/**
	 * 增加资费
	 * @return
	 */
	public int insertCostService(Cost cost);
	/**
	 * 修改资费
	 */
	public int updateCostService(Cost cost);
	/**
	 * 删除资费
	 * @return
	 */
	public int deleteCostService(Cost cost);
	/**
	 * 查询所有资费
	 * @return
	 */
	public List<Cost> selectCostService();
	/**
	 * 查询某一条资费信息
	 * @return
	 */
	public Cost selectCostServiceById(Cost cost);
	/**
	 * 查询某一条资费是否存在
	 * @return
	 */
	public Cost selectCostServiceByName(String cost_name);
	
	/**
	 * 按月租，基费 ，时长排序
	 * @return
	 */
	public List<Cost>orderCostService(Map map);
	/**
	 *启用资费
	 * @return
	 */
	public int startCost(Cost cost);
	/**
	 * 外部接口，查询所有的资费名称
	 * @return
	 */
	public List selectAllCostService();
}
