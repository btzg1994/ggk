<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车主卡数据检测平台</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/back/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/back/js/easyui/themes/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/back/js/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">

<link
	href="${pageContext.request.contextPath}/resources/back/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/back/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/back/css/my.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
.resetPwdBtn {
	
}

.frozenBtn {
	
}
</style>
<!--[if lt IE 9]><script src="${pageContext.request.contextPath}/resources/back/jrjs/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/resources/back/jrjs/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/resources/back/jrjs/html5shiv.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/back/jrjs/respond.min.js"></script>
<![endif]-->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/back/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/easyui/outOfBounds.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/zTree/jquery.ztree.all.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/jquery.ocupload-1.1.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/datetimeformat.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/back/js/jquery.easyui.plus.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/back/js/myjs.js"></script>
<script src="${pageContext.request.contextPath}/resources/back/js/template.3.0.js"></script>
<script type="text/javascript">


	/* 明细下载 */
	function downloadDetail(infoId){
		location.href = '${pageContext.request.contextPath}/sign/jfDhInfo_download/'+infoId;
	}

</script>

</head>


<body>
	<div class="content">
		 <!--顶部信息-->
		<jsp:include page="top.jsp"></jsp:include>
		<!--顶部信息结束-->
    
    <div class="content-box">
    
     		 <!--左边导航-->
      		<jsp:include page="left.jsp">
      			<jsp:param value="statistics_index" name="leftname"/>
      		</jsp:include>
			
			<!--左边导航结束-->

			<!--右边内容-->
			<div class="content-rg">
				<div class="tityj" style="background: #E5F6FE;padding: 7px 0 7px 20px;">
					<div class="fl" style="padding-right: 80px;">累计缴费人数：<span id="total_push"></span>人</div>
					<div class="fl" style="padding-right: 80px;" >累计领卡人数：<span id="total_use"></span>人</div>
					<div class="fl" style="padding-right: 80px;" i>领卡率：<span id="percentage"></span>%</div>
					<div class="fr"></div>
					<div class="clear"></div>
				</div>
				
				<div class="rgcon bodybai">
				
						<div class="border-bom">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table mytab">
							<thead>
								<tr>
									<th>日期</th>
									<th>当天缴费人数</th>
									<th>当天领卡人数</th>
									<th>当天缴费未领卡人数</th>
									<th>电子券兑换人数</th>
									<th>下载</th>
								</tr>
							</thead>

							<tbody  id="data">
								
							<tbody>
						</table>
					</div>

						<!--分页-->
						<div class="fenye">
							
						</div>
						<!--分页结束-->
				</div>
				</div>
			</div>
			<!--右边内容结束-->
		</div>

</body>
<script type="text/javascript">
	$(function(){
		/* 进入页面初始化数据 */		
		renderByUrl("${pageContext.request.contextPath}/sign/info_find/1/10");
		$.post("${pageContext.request.contextPath}/sign/statistics_total_data",{},function(data){
			var total_push = data.total_push;
			var total_use = data.total_use;
			$('#total_push').text(total_push);
			$('#total_use').text(total_use);
			$('#percentage').text(Math.round(total_use / total_push * 10000)/100);
		},"json");
	})
	
	/* 加载数据 */
	function renderByUrl(url){
		$.post(url,{},function(data){
			renderByJson(data);				
		},"text");
	}
	
	/* 根据json数据渲染模版 */
	function renderByJson(pageInfoStr){
		pageInfo = JSON.parse(pageInfoStr);
		if(pageInfo.size == 0){
			$(".fenye").html('');
			$("#data").html('没有满足该条件的数据！');
			return;
		}
		
		
		pageInfo.maxNavigatepageNum = pageInfo.navigatepageNums[pageInfo.navigatepageNums.length-1];
		pageInfo.baseUrl = "${pageContext.request.contextPath}/sign/info_find";
		pageInfo.pageSizeArr=[10,20,30,50,100];
		
		var fenye = template('fenye_tpl', pageInfo);
	  	$(".fenye").html(fenye);
		var data = template('data_tpl', pageInfo);
	  	$("#data").html(data);
	}
</script>
<script type="text/html" id="data_tpl">
								{{each list as l i}}
									<tr>
										<td>{{l.date}}</td>
										<td>{{l.pushCouponsNum}}</td>
										<td>{{l.useCouponsNum}}</td>
										<td>{{l.notUseCouponsNum}}</td>
										<td>{{if l.couponExgNum == -1}}数据获取失败{{else}}{{l.couponExgNum}}{{/if}}</td>
										<td><a href="javascript:downloadDetail({{l.id}});">{{l.date}}_当天缴费未领卡明细</a></td>
									</tr>
								{{/each}}
									
</script>
<script type="text/html" id="fenye_tpl">
						{{if size > 0}}
							<div class="black2 black1 fl">
								<span>共 {{size}} 条 | </span>
								<span>每页显示条数：</span>

								{{each pageSizeArr as ps i}}
									{{if pageSize == ps}}
										<span class="current">{{ps}}条</span>
									{{else}}
										<a href="javascript:renderByUrl('{{baseUrl}}/{{pageNum}}/{{ps}}');">{{ps}}条</a>
									{{/if}}
								{{/each}}										

								
							</div>

							<div class="black2 fr">
								{{if pageNum == 1 }}
										<span class="disabled"> &lt; </span>
								{{else}}
										<a href="javascript:renderByUrl('{{baseUrl}}/{{pageNum - 1}}/{{pageSize}}');"> &lt; </a>
								{{/if}}
									

								{{each navigatepageNums as num i}}
                                	{{if pageNum == num}}
                                		<span class="{{pageNum == num ? 'current':'' }}">{{num}}</span>
                                	{{else}}
                                		<a href="javascript:renderByUrl('{{baseUrl}}/{{num}}/{{pageSize}}');">{{num}}</a>
                                	{{/if}}
                                {{/each}}

                                {{if maxNavigatepageNum != pages}}
	                                  ...<a href="javascript:renderByUrl('{{baseUrl}}/{{pages}}/{{pageSize}}');">{{pages}}</a>
                                {{/if}}

								{{if pageNum == pages }}
										<span class="disabled"> &gt; </span>
								{{else}}
										<a href="javascript:renderByUrl('{{baseUrl}}/{{pageNum + 1}}/{{pageSize}}');">&gt; </a>
								{{/if}}
							</div>
							<div class="clear"></div>
						{{/if}}
</script>
</html>
