package com.itbaizhan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbaizhan.entity.Admin;

@Repository // 注册dao层bean等同于@Component
@SuppressWarnings("unchecked")
public class AdminDao extends BaseDao{

	/**
	 * 通过用户名查找
	 * @param username
	 * @return
	 */
	public Object getByUsername(String username) {
		return (Admin)getSession().createQuery("from Admin where username=:username")
				.setString("username", username).uniqueResult();
	}
	
	/**
	 * 通过用户名和密码查找
	 * @param username
	 * @param password
	 * @return 无记录返回null
	 */
	public Admin getByUsernameAndPassword(String username, String password){
		return (Admin)getSession().createQuery("from Admin where username=:username and password=:password")
				.setString("username", username).setString("password", password).uniqueResult();
	}

	/**
	 * 获取列表
	 * @param page
	 * @param rows
	 * @return 无记录返回空集合
	 */
	public List<Admin> getList(int page, int rows){
		return getSession().createQuery("from Admin").setFirstResult(rows*(page-1)).setMaxResults(rows).list();
	}

	/**
	 * 总数
	 * @return
	 */
	public long getTotal() {
		return (Long) getSession().createQuery("select count(*) from Admin").uniqueResult();
	}

	
}
