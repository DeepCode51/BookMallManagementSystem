package com.itbaizhan.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.itbaizhan.entity.Book;
import com.itbaizhan.entity.Category;
import com.itbaizhan.entity.Indent;
import com.itbaizhan.entity.Users;
import com.itbaizhan.service.BookService;
import com.itbaizhan.service.CategoryService;
import com.itbaizhan.service.IndentService;
import com.itbaizhan.service.UserService;
import com.itbaizhan.util.PageUtil;

@Namespace("/index")
@Results({
	@Result(name="index",location="/index/index.jsp"),
	@Result(name="about",location="/index/about.jsp"),
	@Result(name="category",location="/index/category.jsp"),
	@Result(name="special",location="/index/special.jsp"),
	@Result(name="new",location="/index/new.jsp"),
	@Result(name="sale",location="/index/sale.jsp"),
	@Result(name="login",location="/index/login.jsp"),
	@Result(name="register",location="/index/register.jsp"),
	@Result(name="detail",location="/index/detail.jsp"),
	@Result(name="right",location="/index/right.jsp"),
	@Result(name="cart",location="/index/cart.jsp"),
	@Result(name="order",location="/index/order.jsp"),
	@Result(name="search",location="/index/search.jsp"),
})	
public class IndexAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private static final String indentKey = "indent";

	private int bookid;
	private int category;
	private int flag;
	private Book book;
	private Indent indent;
	private String searchName;
	
	private List<Book> bookList;
	private List<Book> specialList;
	private List<Book> newList;
	private List<Book> saleList;
	private List<Category> categoryList;
	private List<Indent> indentList;
	
	@Resource
	private UserService userService;
	@Resource
	private BookService bookService;
	@Resource
	private IndentService indentService;
	@Resource
	private CategoryService categoryService;
	

	/**
	 * 首页
	 * @return
	 */
	@Action("index")
	public String index(){
		specialList = bookService.getSpecialList(Book.type_special, 1, 2);
		newList = bookService.getSpecialList(Book.type_new, 1, 6);
		flag = 1;
		return "index";
	}
	
	/**
	 * 简介
	 * @return
	 */
	@Action("about")
	public String about(){
		flag = 2;
		return "about";
	}
	
	/**
	 * 精品推荐
	 * @return
	 */
	@Action("special")
	public String special(){
		specialList = bookService.getSpecialList(Book.type_special, page, 3);
		pageTool = PageUtil.getPageTool(servletRequest, bookService.getSpecialTotal(Book.type_special), page, 3);
		flag = 3;
		return "special";
	}
	
	/**
	 * 最新出版
	 * @return
	 */
	@Action("new")
	public String news(){
		newList = bookService.getSpecialList(Book.type_new, page,3);
		pageTool = PageUtil.getPageTool(servletRequest, bookService.getSpecialTotal(Book.type_new), page, 3);
		flag = 4;
		return "new";
	}
	
	/**
	 * 优惠促销
	 * @return
	 */
	@Action("sale")
	public String sale(){
		saleList = bookService.getSpecialList(Book.type_sale, page, 3);
		pageTool = PageUtil.getPageTool(servletRequest, bookService.getSpecialTotal(Book.type_sale), page, 3);
		flag = 5;
		return "sale";
	}
	
	/**
	 * 登录
	 * @return
	 */
	@Action("login")
	public String login(){
		flag = 6;
		return "login";
	}
	
	/**
	 * 注册
	 * @return
	 */
	@Action("register")
	public String register(){
		flag = 7;
		return "register";
	}
	
	/**
	 * 类目搜索
	 * @return
	 */
	@Action("category")
	public String category(){
		bookList = bookService.getCategoryList(category, page, 12);
		pageTool = PageUtil.getPageTool(servletRequest, bookService.getCategoryTotal(category), page, 12);
		return "category";
	}
	
	/**
	 * 名称搜索
	 * @return
	 */
	@Action("search")
	public String search(){
		if (searchName!=null && !searchName.trim().isEmpty()) {
			bookList = bookService.getList(searchName, page, 12);
			pageTool = PageUtil.getPageTool(servletRequest, bookService.getTotal(searchName), page, 12);
		}
		return "search";
	}
	
	/**
	 * 详情
	 * @return
	 */
	@Action("detail")
	public String detail(){
		book = bookService.get(bookid);
		return "detail";
	}

	/**
	 * 右侧信息
	 * @return
	 */
	@Action("right")
	public String right(){
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		return "right";
	}
	
	/**
	 * 查看购物车
	 * @return
	 */
	@Action("cart")
	public String cart() {
		Object username = getSession().get("username");
		if (username!=null && !username.toString().isEmpty()) {
			List<Indent> indentList = indentService.getListByUserid(userService.get(username.toString()).getId());
			if (indentList!=null && !indentList.isEmpty()) {
				indent = indentList.get(0); // 最后一次订单信息
			}
		}
		return "cart";
	}
	
	/**
	 * 购买
	 * @return
	 */
	@Action("buy")
	public void buy(){
		Indent indent = (Indent) getSession().get(indentKey);
		if (indent==null) {
			getSession().put(indentKey, indentService.createIndent(bookService.get(bookid)));
		}else {
			getSession().put(indentKey, indentService.addIndentItem(indent, bookService.get(bookid)));
		}
		sendResponseMsg("ok");
	}
	
	/**
	 * 减少
	 */
	@Action("lessen")
	public void lessen(){
		Indent indent = (Indent) getSession().get(indentKey);
		if (indent != null) {
			getSession().put(indentKey, indentService.lessenIndentItem(indent, bookService.get(bookid)));
		}
		sendResponseMsg("ok");
	}
	
	/**
	 * 删除
	 */
	@Action("delete")
	public void delete(){
		Indent indent = (Indent) getSession().get(indentKey);
		if (indent != null) {
			getSession().put(indentKey, indentService.deleteIndentItem(indent, bookService.get(bookid)));
		}
		sendResponseMsg("ok");
	}
	
	/**
	 * 提交订单
	 * @return
	 */
	@Action("save")
	public String save(){
		Object username = getSession().get("username");
		if (username==null || username.toString().isEmpty()) {
			addActionMessage("请登录后提交订单!");
			return "login";
		}
		Indent indentSession = (Indent) getSession().get(indentKey);
		Users user = userService.get(username.toString());
		indentSession.setUser(user);
		indentSession.setName(indent.getName());
		indentSession.setPhone(indent.getPhone());
		indentSession.setAddress(indent.getAddress());
		indentService.saveIndent(indentSession);	// 保存订单
		getSession().remove(indentKey);	// 清除购物车
		addActionMessage("提交订单成功!");
		return "cart";
	}
	
	/**
	 * 查看订单
	 * @return
	 */
	@Action("order")
	public String order(){
		Object username = getSession().get("username");
		if (username==null || username.toString().isEmpty()) {
			addActionMessage("请登录后提交订单!");
			return "login";
		}
		indentList = indentService.getListByUserid(userService.get(username.toString()).getId());
		if (indentList!=null && !indentList.isEmpty()) {
			for(Indent indent : indentList){
				indent.setItemList(indentService.getItemList(indent.getId(), 1, 100)); // 暂不分页
			}
		}
		return "order";
	}
	
	
	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}

	public List<Book> getSpecialList() {
		return specialList;
	}

	public void setSpecialList(List<Book> specialList) {
		this.specialList = specialList;
	}

	public List<Book> getNewList() {
		return newList;
	}

	public void setNewList(List<Book> newList) {
		this.newList = newList;
	}

	public List<Book> getSaleList() {
		return saleList;
	}

	public void setSaleList(List<Book> saleList) {
		this.saleList = saleList;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public List<Indent> getIndentList() {
		return indentList;
	}

	public void setIndentList(List<Indent> indentList) {
		this.indentList = indentList;
	}

	public Indent getIndent() {
		return indent;
	}

	public void setIndent(Indent indent) {
		this.indent = indent;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
}
