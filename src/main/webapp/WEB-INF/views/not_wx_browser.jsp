<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/8
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>resources/" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1.0,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="telephone=no" name="format-detection" />
    <title>温馨提示</title>
    <link href="css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="tsbody">
<div class="content">

    <div class="error_con error_con2 weixin">
        <dl>
            <dt><img src="images/weixin_ico2.png"></dt>
            <dd  class="xx_tishi3">
                请使用微信浏览器打开页面
            </dd>
        </dl>

    </div>


</div>
</body>
</html>

