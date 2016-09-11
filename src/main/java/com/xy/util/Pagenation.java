package com.xy.util;
/**
 * 分页类
 * @author soonsmile
 *
 */
public class Pagenation {
	int page;//第几页
	int rows;//每页多少条记录
	int start;//从哪一行开始查询
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public Pagenation(int page, int rows) {
		super();
		this.page = page;
		this.rows = rows;
		this.setStart((page-1)*rows);
	}
	public Pagenation() {
		super();
		
	}
}
