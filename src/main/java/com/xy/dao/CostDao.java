package com.xy.dao;

import java.util.List;
import java.util.Map;
import com.xy.entity.Cost;

public interface CostDao {
	/**
	 * 增加资费
	 * @return
	 */
	public int insertCostDao(Cost cost);
	/**
	 * 修改资费
	 */
	public int updateCostDao(Cost cost);
	/**
	 * 删除资费
	 * @return
	 */
	public int deleteCostDao(Cost cost);
	/**
	 * 查询所有资费
	 * @return
	 */
	public List<Cost> selectCostDao();
	/**
	 * 查询某一条资费是否存在
	 * @return
	 */
	public Cost selectCostByNameDao(String cost_name);
	/**
	 * 查询某一条资费信息
	 * @return
	 */
	public Cost selectCostByIdDao(Cost cost);
	
	/**
	 * 按月租，基费 ，时长排序
	 * @return
	 */
	public List<Cost>orderCostDao(Map map);
	/**
	 * 启用资费
	 * @return
	 */
	public int startCostDao(Cost cost);
	/**
	 * 查询所有资费名称
	 * @return
	 */
	public List selectAllCostDao();
	/**
	 * 通过id查询信息
	 * @param cost_id
	 * @return
	 */
	public Cost selectCostDaoByid(int cost_id);
	/**
	 * 通过资费名查询资费id
	 * @param cost_name
	 * @return
	 */
	public Cost selectCostByCnameDao(String cost_name);
	
	
}
