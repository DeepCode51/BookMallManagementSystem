package com.itbaizhan.action;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

/**
 * action基类, 继承自ActionSupport类  
 * 为子类提供struts2 map类型session对象
 * 提供分页工具变量等
 */
public class BaseAction extends ActionSupport implements SessionAware,ServletRequestAware {
	private static final long serialVersionUID = 1L;
	
	protected int page = 1;
	protected String pageTool;
	protected Map<String, Object> session;
	protected HttpServletRequest servletRequest;

	
	@Override//重写自父接口SessionAware的方法,有容器自行调用并给session对象赋值
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	//用于在子类中获取session对象
	public Map<String, Object> getSession(){
		return session;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getPageTool() {
		return pageTool;
	}

	public void setPageTool(String pageTool) {
		this.pageTool = pageTool;
	}

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}
	
	/**
	 * 返回响应数据
	 * @param msg
	 */
	protected void sendResponseMsg(String msg) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.addHeader("Cache-Control", "must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setDateHeader("Expires", 0);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(msg);
		} catch (Throwable e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

}
