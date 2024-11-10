package com.itbaizhan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbaizhan.entity.Indent;
import com.itbaizhan.entity.Items;

@Repository // 注册dao层bean等同于@Component
@SuppressWarnings("unchecked")
public class IndentDao extends BaseDao{

	/**
	 * 获取订单列表
	 * @param page
	 * @param row
	 */
	public List<Indent> getList(int status, int page, int rows) {
		return getSession().createQuery("from Indent where status="+status+" order by id desc").setFirstResult((page-1)*rows).setMaxResults(rows).list();
	}

	/**
	 * 获取总数
	 * @return
	 */
	public long getTotal(int status) {
		return (Long) getSession().createQuery("select count(*) from Indent where status="+status).uniqueResult();
	}

	/**
	 * 订单项列表
	 * @param indentid
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<Items> getItemList(int indentid, int page, int rows) {
		return getSession().createQuery("from Items where indent_id="+indentid).setFirstResult((page-1)*rows).setMaxResults(rows).list();
	}

	/**
	 * 订单项总数
	 * @return
	 */
	public long getItemTotal(int indentid) {
		return (Long) getSession().createQuery("select count(*) from Items where indent_id="+indentid).uniqueResult();
	}

	/**
	 * 按用户名查找
	 * @param userid
	 * @return
	 */
	public List<Indent> getListByUserid(int userid) {
		return getSession().createQuery("from Indent where user_id="+userid+" order by id desc").list();
	}
	

}
