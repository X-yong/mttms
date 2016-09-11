package com.xy.dao;

import java.util.List;
import java.util.Map;

import com.xy.entity.Business;
import com.xy.entity.Customer;

public interface BusinessDao {
	
	/**
	 * 外部接口
	 * 删除业务账号（假删除） 通过Customer传过来的c_id
	 * @return
	 */
   public int updateBusinessByCidDao(Customer customer);
   /**
	 * 外部接口
	 * 开通或暂停业务账号 ， 通过Customer传过来的c_id
	 * @return
	 */ 
   public int operateBycidDao(int c_id);
   
   /**
    * 查询所有业务信息
    * @param business
    * @return
    */
   public List selectBusinessAllDao(Map map);
   /**
    * 通过c_id查询是否有业务账号存在
    * @param c_id
    * @return
    */
   public Business selectBusinessBycidDao(int c_id);
   /**
    * 增加业务账号
    * @return
    */
   public int insertBusinessDao(Map map);
   /**
    * 开通或暂停操作
    * @param b_id
    * @return
    */
   public int updateBusinessByBidDao(Map map);
   /**
    *删除操作
    * @param b_id
    * @return
    */
   public int deleteBusinessByBidDao(int b_id);
   /**
    * 查询所有记录的条数
    * @return
    */
   public int selectAllcountDao();
   /**
    * 修改业务账号信息
    * @return
    */
   public int updateBusinessInfoDao(Map map);
   /**
    * 通过b_id查询账务账号
    * @return
    */
   public Business selectAllBybidDao(int b_id);
   
}
