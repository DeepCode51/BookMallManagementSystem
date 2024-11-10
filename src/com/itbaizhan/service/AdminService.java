package com.itbaizhan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itbaizhan.dao.AdminDao;
import com.itbaizhan.entity.Admin;
import com.itbaizhan.util.SafeUtil;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class AdminService {

	@Resource		//spring注入类对象
	private AdminDao adminDao;
	
	/**
	 * 验证用户密码
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean checkUser(String username, String password){
		return adminDao.getByUsernameAndPassword(username, SafeUtil.encode(password)) != null;
	}
	
	/**
	 * 是否存在
	 * @param username
	 * @return
	 */
	public boolean isExist(String username) {
		return adminDao.getByUsername(username) != null;
	}

	/**
	 * 列表
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<Admin> getList(int page, int rows) {
		return adminDao.getList(page, rows);
	}

	/**
	 * 总数
	 * @return
	 */
	public long getTotal() {
		return adminDao.getTotal();
	}

	/**
	 * 通过id查询
	 * @param id
	 * @return
	 */
	public Admin get(int id) {
		return adminDao.get(Admin.class, id);
	}
	
	/**
	 * 添加
	 * @param admin
	 */
	public Integer add(Admin admin) {
		admin.setPassword(SafeUtil.encode(admin.getPassword()));
		return adminDao.save(admin);
	}
	
	/**
	 * 更新
	 * @param user
	 */
	public boolean update(Admin admin) {
		return adminDao.update(admin);
	}

	/**
	 * 删除
	 * @param user
	 */
	public boolean delete(Admin admin) {
		return adminDao.delete(admin);
	}


	
}
