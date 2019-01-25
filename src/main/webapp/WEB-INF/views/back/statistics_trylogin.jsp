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
#masking-bg{background-color:#CCC; width: 100%; height: 100%; left: 0; top: 0; z-index: 1; position: absolute; filter: alpha(opacity=80); opacity: 0.6;display: none;}
#masking-layer{display: none;height:500px;width:100%;position:absolute;top:0;}
#masking-layer div{position: absolute;z-index: 1000;}
.close{left:80%;top:15%;z-index:1001 !important;}
.close img{width:30px;}
.masking-banner{top:10%;text-align:center;width:100%;}
.masking-banner .img-bg{width:100%;}
.masking-banner .img {position:absolute;z-index:1001;left:40%;top:35%;width:25%;}
.masking-banner div{position:absolute;z-index:1001;left:25%;top:70%;width:50%;}
.skip{left:38%; top:80%; color:#fff; text-align:center;width:100%;} 
.index-sure{background-color:#ce1c40;color:#FFF;padding:10px 20px;text-align: center;border-radius:5px;display:block;width:25%;}
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
	function sendMsg(accNbr,acceptNo){
		showMasking();
		$.post('${pageContext.request.contextPath}/sign/sendCard',{'accNbr':accNbr,'acceptNo':acceptNo},function(data){
			$('#closeBtn').show();
			if(data == 1){
				$('#info').text('发送成功！');
			}else if(data == 0){
				$('#info').text('发送失败！');
			}else if(data == -1){
				$('#info').text('系统繁忙！');
			}
		},'json');
	}

</script>
<script>
	$(function(){
		$('#closeBtn').click(function(){
			closeMasking();
		});	
	})
    function showMasking(){
        $('#masking-bg').css('display','block');
        $('#masking-layer').css('display','block');
    }
    function closeMasking(){
        $('#masking-bg').css('display','none');
        $('#masking-layer').css('display','none');
    }
</script>



</head>


<body>
    <div id="masking-bg"> 
    </div> 
    <div id="masking-layer">
        <div class="masking-banner" style="padding-top: 300px;">
            <div style="font-size:50px;"><span id="info">正在发送...</span></div>
        </div>
         <div class="skip"> 
            <div class="index-sure font-13" id="closeBtn" style="display: none"> 
            确定
            </div> 
        </div>
        
     </div>

	<div class="content">
		<!--顶部信息-->
		<jsp:include page="top.jsp"></jsp:include>
		<!--顶部信息结束-->
    
    
    <div class="content-box">
    
			
     		 <!--左边导航-->
      		<jsp:include page="left.jsp">
      			<jsp:param value="statistics_trylogin" name="leftname"/>
      		</jsp:include>
			
			<!--左边导航结束-->

			<!--右边内容-->
			<div class="content-rg">
				<div class="tityj">
					<p id="contentTitle" class="fl"></p>
					<div class="fr"></div>
					<div class="clear"></div>
				</div>
				
				<div class="rgcon bodybai">
					<div class="col-md-2">
						<form class="form-horizontal">
					    	<input type="tel" maxlength="11" class="form-control"  name="jf_phone" id="jf_phone" value="" placeholder="手机号">
						</form>
					</div>
					<div class="col-md-2">
							<a  id="searchBtn" href="javascript:renderByUrl('${pageContext.request.contextPath}/sign/findUseDetailByPhone/');" class="btn btn-info" >查询</a>
					</div>
					<div class="border-bom" style="margin-top: 50px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table mytab" >
							<thead>
								<tr>
									<th>手机号</th>
									<th>订单号</th>
									<th>领卡时间</th>
									<th>旅游卡号</th>
									<th>重发旅游卡短信</th>
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
	
	/* 加载数据 */
	function renderByUrl(url){
		var jf_phone = $('#jf_phone').val();
		url = url + jf_phone;
		
		$.post(url,{},function(data){
			renderByJson(data);				
		},"json");
	}
	
	/* 根据json数据渲染模版 */
	function renderByJson(jsonObj){
		if(!jsonObj.list || jsonObj.list.length == 0){
			$("#data").html('没有满足该条件的数据！');
			return;
		}
		
		var data = template('data_tpl', jsonObj);
	  	$("#data").html(data);
	}
</script>
<script type="text/html" id="data_tpl">
								{{each list as l i}}
									<tr>
										<td>{{l.usePhone}}</td>
										<td>{{l.accetpno}}</td>
										<td>{{l.useTime}}</td>
										<td>{{l.cardNumber}}</td>
										<td><a style="cursor:pointer" onclick="sendMsg('{{l.usePhone}}','{{l.accetpno}}')">发送</a></td>
									</tr>
								{{/each}}
									
</script>
</html>
