
package com.itbaizhan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbaizhan.entity.Category;

@Repository // 注册dao层bean等同于@Component
@SuppressWarnings("unchecked")
public class CategoryDao extends BaseDao{

	
	/**
	 * 获取列表
	 * @return
	 */
	public List<Category> getList() {
		return getSession().createQuery("from Category").list();
	}
	
	/**
	 * 获取列表
	 * @param rows 
	 * @param page 
	 * @return 无记录返回空集合
	 */
	public List<Category> getList(int page, int rows){
		return getSession().createQuery("from Category order by id desc").setFirstResult((page-1)*rows).setMaxResults(rows).list();
	}

	/**
	 * 总数
	 * @return
	 */
	public long getTotal() {
		return (Long) getSession().createQuery("select count(*) from Category").uniqueResult();
	}


}
