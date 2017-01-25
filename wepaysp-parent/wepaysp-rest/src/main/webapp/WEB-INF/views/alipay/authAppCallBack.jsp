<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<head>
		<meta charset="utf-8" />
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>应用授权结果</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/weui.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/font/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main.css"/>
		<script  src="<%=request.getContextPath()%>/resources/js/jquery-1.9.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/keyboard.js"></script>
	    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/check.js"></script>
	</head>
</head>
<body>
		<c:choose> 
			<c:when test="${bindResult.result == 'success'  }">
				<p class="succ-title">
					<i class="weui_icon_msg weui_icon_success"></i>绑定成功
				</p>
				<div class="succ-info">
					<p class="info1">${payNoticeBindWeixinVO.nickname }</p>
					<div class="break-line"></div>
					<div class="succ-item">
						门&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;店<span class="fr">${payNoticeBindWeixinVO.storeName }</span>
					</div>
					<c:if test="${bindType == 2}">
						<div class="succ-item">
							收银员<span class="fr">${payNoticeBindWeixinVO.payDealerEmployeeName }</span>
						</div>
					</c:if>
					<div class="succ-item">
						绑定时间<span class="fr"><fmt:parseDate value="${payNoticeBindWeixinVO.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
					</div>
		     	 </div> 
			</c:when> 
			<c:when test="${bindResult.result == 'bound' }">
				<p class="error-title">
					 <i class="weui_icon_warn"></i>已绑定
				</p>		
				<div class="succ-info">
					<div class="error-bottom">
						<img class="yzf-img" src="<%=request.getContextPath()%>/resources/images/pay-error.png" alt="" />
					</div>			
					<p class="info2">${bindResult.desc }</p>
				</div>
			</c:when> 
			<c:otherwise>
				<p class="error-title">
					 <i class="weui_icon_warn"></i>绑定失败
				</p>		
				<div class="succ-info">
					<div class="error-bottom">
						<img class="yzf-img" src="<%=request.getContextPath()%>/resources/images/pay-error.png" alt="" />
					</div>			
					<p class="info2">绑定失败请重试</p>
				</div>
			</c:otherwise> 
		</c:choose> 
</body>
</html>