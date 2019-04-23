package cn.mogao.utils;

import java.util.List;

/**
 *
 * @author yq
 * @Date  2019/04/17
 *
 */


public class PageUtil<T> {
	
	//每页显示的数据条数
	private int page_size;
	
	//上一页
	private int page_last;
	 
	//下一页
	private int page_next;
	
	//数据可以分为的页数
	private long page_total;
	
	//当前页数
	private int page_current;
	
	//每页显示的数据集合
	
	private List<T> page_list;

	public int getPage_size() {
		return page_size;
	}

	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}

	public int getPage_last() {
		return page_last;
	}

	public void setPage_last(int page_last) {
		this.page_last = page_last;
	}

	public int getPage_next() {
		return page_next;
	}

	public void setPage_next(int page_next) {
		this.page_next = page_next;
	}

	public long getPage_total() {
		return page_total;
	}

	public void setPage_total(long page_total) {
		this.page_total = page_total;
	}

	public int getPage_current() {
		return page_current;
	}

	public void setPage_current(int page_current) {
		this.page_current = page_current;
	}

	public List<T> getPage_list() {
		return page_list;
	}

	public void setPage_list(List<T> page_list) {
		this.page_list = page_list;
	}
	
	

}
