package com.itbaizhan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbaizhan.entity.Book;

@Repository // 注册dao层bean等同于@Component
@SuppressWarnings("unchecked")
public class BookDao extends BaseDao{

	
	/**
	 * 	通过名称搜索
	 * @param category
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Book> getList(String name, int page, int size){
		return getSession().createQuery("from Book where name like '%"+name+"%'")
				.setFirstResult((page-1)*size).setMaxResults(size).list();
	}
	
	/**
	 * 	获取名称总数
	 * @param type 1推荐/2新书/3特价
	 * @return
	 */
	public long getTotal(String name){
		return (Long) getSession().createQuery("select count(*) from Book where name like '%"+name+"%'")
				.uniqueResult();
	}
	
	/**
	 * 	通过分类搜索
	 * @param category
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Book> getCategoryList(int category, int page, int size){
		return getSession().createQuery("from Book where category=:category").setInteger("category", category)
				.setFirstResult((page-1)*size).setMaxResults(size).list();
	}
	
	/**
	 * 	获取分类总数
	 * @param type 1推荐/2新书/3特价
	 * @return
	 */
	public long getCategoryTotal(int category){
		return (Long) getSession().createQuery("select count(*) from Book where category=:category")
				.setInteger("category", category).uniqueResult();
	}
	
	/**
	 * 	获取特卖列表
	 * @param type 1推荐/2新书/3特价
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Book> getSpecialList(int type, int page, int size){
		return getSession().createQuery("from Book "+packWhereSql(type))
				.setFirstResult((page-1)*size).setMaxResults(size).list();
	}
	
	/**
	 * 	获取特卖总数
	 * @param type 1推荐/2新书/3特价
	 * @return
	 */
	public long getSpecialTotal(int type){
		return (Long) getSession().createQuery("select count(*) from Book "+packWhereSql(type)).uniqueResult();
	}
	
	/**
	 * 封装sql
	 * @param type
	 * @return
	 */
	private String packWhereSql(int type) {
		String sql = "";
		switch (type) {
		case Book.type_special:
			sql += "where special=1";
			break;
		case Book.type_new:
			sql += "where news=1";
			break;
		case Book.type_sale:
			sql += "where sale=1";
			break;
		}
		return sql;
	}

	/**
	 * 获取列表
	 * @param page
	 * @param rows
	 * @return 无记录返回空集合
	 */
	public List<Book> getList(int status, int page, int rows){
		return getSession().createQuery("from Book "+packSql(status)+" order by id desc").setFirstResult(rows*(page-1)).setMaxResults(rows).list();
	}

	/**
	 * 总数
	 * @return
	 */
	public long getTotal(int status) {
		return (Long) getSession().createQuery("select count(*) from Book "+packSql(status)).uniqueResult();
	}
	
	/**
	 * 封装sql
	 * @param status
	 * @return
	 */
	private String packSql(int status) {
		String sql = "";
		switch (status) {
		case 1:
			sql += " where special=1";
			break;
		case 2:
			sql += " where news=1";
			break;
		case 3:
			sql += " where sale=1";
			break;
		}
		return sql;
	}
	
}
