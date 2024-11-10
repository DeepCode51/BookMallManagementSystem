package com.itbaizhan.util;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;


/**
 * 分页工具类
 */
public class PageUtil {
	
	
	/**
	 * 获取分页工具
	 * @param total 总记录数
	 * @param page 当前页面
	 * @param size 每页数量
	 * @return
	 */
	public static String getPageTool(HttpServletRequest request, long total, int page, int size){
		if (total <= 0) {
			return null;
		}
		// 计算总页数
		int pages = (int) (total % size ==0 ? total/size : total /size + 1);
		pages = pages == 0 ? 1 : pages;
		// 请求地址
		String url = request.getRequestURL().toString();
		// 请求参数
		StringBuilder paramBuilder = new StringBuilder();
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String param = params.nextElement();
			if(param.indexOf("page") > -1) {
				continue;
			}
			paramBuilder.append("&").append(param).append("=").append(request.getParameter(param));
		}
		
		// 分页字符串
		StringBuilder pageBuilder = new StringBuilder();
		pageBuilder.append("<div class='pagination'>");
		// 上一页
		if (page <= 1) { // 如果已经是第一页, 上一页按钮disabled
			pageBuilder.append("<span class='disabled'><<</span>");
		}else{
			pageBuilder.append("<span>").append("<a href='").append(url).append("?").append("page=").append(page-1)
			.append(paramBuilder).append("'>").append("<<").append("</a>").append("</span>");
		}
		// 中间数字页码
		if (pages <= 7) { // 全部显示
			for (int i = 1; i <= pages; i++) {
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, i));
			}
		}else{ // 显示部分
			if (page<4 || page>pages-3) { // 1 2 3 ... pages-2 pages-1 pages
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, 1));
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, 2));
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, 3));
				pageBuilder.append(" ... ");
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, pages-2));
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, pages-1));
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, pages));
			}else{	// 1 2 ... page-1 page page+1 ... pages-1 pages
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, 1));
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, 2));
				pageBuilder.append(" ... ");
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, page-1));
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, page));
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, page+1));
				pageBuilder.append(" ... ");
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, pages-1));
				pageBuilder.append(packPageItem(url, paramBuilder.toString(), page, pages));
			}
		}
		// 下一页
		if (page >= pages) { // 如果已经是最后一页, 上一页按钮disabled
			pageBuilder.append("<span class='disabled'>>></span>");
		}else{
			pageBuilder.append("<span>").append("<a href='").append(url).append("?").append("page=").append(page+1)
			.append(paramBuilder).append("'>").append(">>").append("</a>").append("</span>");
		}
		pageBuilder.append("</div>");
		return pageBuilder.toString();
	}

	/**
	 * 封装分页项
	 * @param url
	 * @param params
	 * @param page
	 * @param i
	 * @return
	 */
	private static String packPageItem(String url, String params, int page, int i) {
		StringBuilder pageBuilder = new StringBuilder();
		if (i == page) {
			pageBuilder.append("<span class='current'>").append(i).append("</span>");
		}else{
			pageBuilder.append("<a href='").append(url).append("?").append("page=").append(i)
				.append(params).append("'>");pageBuilder.append(i).append("</a>");
		}
		return pageBuilder.toString();
	}
	
	
	/**
	 * 后台管理分页
	 * @param request
	 * @param total
	 * @param page
	 * @param size
	 * @return
	 */
	public static String getPageToolAdmin(HttpServletRequest request, long total, int page, int size) {
		if (total <= 0) {
			return null;
		}
		// 计算总页数
		int pages = (int) (total % size ==0 ? total/size : total /size + 1);
		pages = pages == 0 ? 1 : pages;
		// 请求地址
		String url = request.getRequestURL().toString();
		// 请求参数
		StringBuilder paramBuilder = new StringBuilder();
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String param = params.nextElement();
			if(param.indexOf("page") > -1) {
				continue;
			}
			paramBuilder.append("&").append(param).append("=").append(request.getParameter(param));
		}
		
		// 分页字符串
		StringBuilder pageBuilder = new StringBuilder();
		pageBuilder.append("<div style='width:140px;float:right;'>");
		// 上一页
		if (page <= 1) { // 如果已经是第一页, 上一页按钮disabled
			pageBuilder.append("<span style='color:lightgray'>上一页</span>");
		}else{
			pageBuilder.append("<span>").append("<a href='").append(url).append("?").append("page=").append(page-1)
			.append(paramBuilder).append("'>").append("上一页").append("</a>").append("</span>");
		}
		// 中间数字页码
		pageBuilder.append("[").append(page).append("/").append(pages).append("]");
		// 下一页
		if (page >= pages) { // 如果已经是最后一页, 上一页按钮disabled
			pageBuilder.append("<span style='color:lightgray'>下一页</span>");
		}else{
			pageBuilder.append("<span>").append("<a href='").append(url).append("?").append("page=").append(page+1)
			.append(paramBuilder).append("'>").append("下一页").append("</a>").append("</span>");
		}
		pageBuilder.append("</div>");
		return pageBuilder.toString();
	}

}
