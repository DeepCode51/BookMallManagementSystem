package com.itbaizhan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbaizhan.entity.Users;

@Repository // 注册dao层bean等同于@Component
public class UserDao extends BaseDao{

	
	/**
	 * 通过用户名查找用户
	 * @return 无记录返回null
	 */
	public Users getByUsername(String username){
		return (Users) getSession().createQuery("from Users where username=:username")
				.setString("username", username).uniqueResult();
	}
	
	/**
	 * 通过用户名和密码查找
	 * @param username
	 * @param password
	 * @return 无记录返回null
	 */
	public Users getByUsernameAndPassword(String username, String password){
		return (Users) getSession().createQuery("from Users where username=:username and password=:password")
				.setString("username", username).setString("password", password).uniqueResult();
	}
	
	/**
	 * 获取列表
	 * @param page
	 * @param rows
	 * @return 无记录返回空集合
	 */
	@SuppressWarnings("unchecked")
	public List<Users> getList(int page, int rows){
		return getSession().createQuery("from Users").setFirstResult(rows*(page-1)).setMaxResults(rows).list();
	}

	/**
	 * 总数
	 * @return
	 */
	public long getTotal() {
		return (Long) getSession().createQuery("select count(*) from Users").uniqueResult();
	}
	
}
