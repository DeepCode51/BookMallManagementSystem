<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书店简介</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>书店简介</div>
		<div class="feat_prod_box_details">
			<p class="details">
				<img src="images/about.gif" class="right" />
				书店隶属于北方联合出版传媒（集团）股份有限公司,是全国首家由省级新华书店控股的国有股份制图书零售企业，
				开业十年来，一直与国内外五百家出版社，近千家发行单位保持着良好的合作关系。
				以其集文化传播、艺术鉴赏、休闲为一体的崭新经营方式、一流的购书环境及优质的服务，
				赢得了众多的荣誉，成为东北地区最大的集图书、音像制品、文化用品、快餐、软件开发、广告策划于一体的图书零售企业。
				<br/><br/>
			    书店从1998年发展连锁经营至今，现已拥有直营连锁店十六家，总营业面积达四万多平方米，
			    仅改造扩建后的旗舰店经营面积就达到一万八千多平方米。经营图书、音像制品近五十余万种，文化用品近万种。
			    通过统一进货、统一物流、统一标准、统一品牌、统一促销活动，扩大市场份额、降低管理成本、增加调整品种结构，
			    从而提高了书城的连锁经营效率，且于2003年建立了商业发展前沿的B-TO-C电子商务模式，一直稳步发展前进至今。　
			    <br/><br/>
			    书店于2001年11月14日率先在业内通过了ISO9001-2000的质量管理体系认证，
			    规范了公司的质量管理和质量保证机制，从而达到了为顾客提供满意优质的人性化服务。
			    通过ISO认证的书店用人性化理念带给读者全新的购书享受――音像专区、文化用品专区、
			    少儿图书区等几大特色区以其各自独有魅力成为人性化图书卖场的重要组成部分。
			    除此之外，以“文化、休闲、娱乐、消遣”为主题的经营倡导为广大读者提供了各种服务功能
			    ――网上书店、VIP会员俱乐部、咖啡吧、亲子娱乐天地、自助试盘区、多功能活动大厅等，
			    通过与读者的互动，为其提供优雅、明快的购书环境和人性化的高水准服务，让读者在购书时尽情地享受生活，
			    全方位彰显了书店“行业先导，国际一流”的独特品质。
			    <br/><br/>
			    书店连续三年获得了新闻出版署举办“讲信誉、重服务”单位的光荣称号。
			    2000年12月被辽宁省文化市场办授予首家“全国音像制品正版销售单位”。
			    书店不仅是出版发行部门开拓图书市场，开通货源渠道的驿站，
			    更是广大读者朋友读书、选书、购书的最佳场所，傲然矗立在图书领域，
			    成为东北乃至更广大地域走向知识经济新时代的桥梁和纽带。 
		    </p>
		</div>
		
		<div class="clear"></div>
	
	</div>
   
   	<s:action name="/book/index!right" executeResult="true"/>
   
	<div class="clear"></div>
	
</div>

<jsp:include page="footer.jsp"/>

</div>

</body>
</html>