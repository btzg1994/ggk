<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<div class="content-lf">
				<dl class="mymenu">
					<!-- 不含子节点 -->
					<dt class="menu_title" >
						<p class="gl_ico" >
							<a href="${pageContext.request.contextPath}/b/sign/statistics_index" <c:if test="${param.leftname eq 'statistics_index'}">style="color:#fff;background-color: #44b549 " </c:if>>数据统计 </a>
						</p>
					</dt>
					<dt class="menu_title" >
						<p class="gl_ico" >
							<a href="${pageContext.request.contextPath}/b/sign/statistics_trylogin" <c:if test="${param.leftname eq 'statistics_trylogin'}">style="color:#fff;background-color: #44b549 " </c:if>>trylogin</a>
						</p>
					</dt>
					
				</dl>
			</div>