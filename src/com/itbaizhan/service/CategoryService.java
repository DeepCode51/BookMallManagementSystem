package com.itbaizhan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itbaizhan.dao.CategoryDao;
import com.itbaizhan.entity.Category;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class CategoryService {

	@Resource	
	private CategoryDao categoryDao;
	
	/**
	 * 获取列表
	 * @return
	 */
	public List<Category> getList(){
		return categoryDao.getList();
	}

	/**
	 * 列表
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<Category> getList(int page, int rows) {
		return categoryDao.getList(page, rows);
	}

	/**
	 * 总数
	 * @return
	 */
	public long getTotal() {
		return categoryDao.getTotal();
	}

	/**
	 * 通过id查询
	 * @param id
	 * @return
	 */
	public Category get(int id) {
		return categoryDao.get(Category.class, id);
	}
	
	/**
	 * 添加
	 * @param category
	 * @return
	 */
	public Integer add(Category category) {
		return categoryDao.save(category);
	}

	/**
	 * 更新
	 * @param category
	 */
	public boolean update(Category category) {
		return categoryDao.update(category);
	}

	/**
	 * 删除
	 * @param category
	 */
	public boolean delete(Category category) {
		return categoryDao.delete(category);
	}
	
}
