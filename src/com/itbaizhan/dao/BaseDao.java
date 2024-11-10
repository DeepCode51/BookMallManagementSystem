package com.itbaizhan.dao;

import java.io.Serializable;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 * dao层基类  
 * 方便子类获取session对象, 及其他公用属性及方法
 * 如果遇到异常HibernateException("No Sessionfound for current thread"), 是因为调用请求没有在spring事务中
 * 此类中通过getCurrentSession得到的session对象被绑定在spring线程SpringSessionContext中而不是ThreadLocalSessionContext
 * 因此必须要在spring事务中才能使用session对象, 此session在事务开启时自动创建, 事务结束后自动销毁
 * 如果想使部分方法不开启事务, 除了使用openSession手动创建和销毁, 当前还没发现好的解决方案
 */
public class BaseDao {

	@Resource
	private SessionFactory sessionFactory;
	private Session session;
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		this.session = sessionFactory.getCurrentSession();
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
	
	
	/**
	 * 主键查询
	 * @param clazz
	 * @param id
	 * @return 无记录返回null
	 */
	@SuppressWarnings("unchecked")
	public <T> T get(Class<T> clazz, Serializable id){
		return (T)getSession().get(clazz, id);
	}
	
	/**
	 * 添加
	 * @param object
	 * @return 返回主键
	 */
	public Integer save(Object object){
		return (Integer) getSession().save(object);
	}
	
	/**
	 * 修改 实体无主键时抛StaleStateException
	 * @param object
	 * @return
	 */
	public boolean update(Object object){
		try {
			getSession().update(object);
		} catch (HibernateException e) {
			return false;
		}return true;
	}
	
	/**
	 * 删除 实体无主键时不执行, 直接返回true
	 * @param object
	 * @return
	 */
	public boolean delete(Object object){
		try {
			getSession().delete(object);
		} catch (HibernateException e) {
			return false;
		}return true;
	}

}
