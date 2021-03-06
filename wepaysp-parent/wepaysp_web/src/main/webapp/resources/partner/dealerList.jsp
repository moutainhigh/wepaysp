<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="manage" uri="/permission-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>商户信息管理</title>
	<link href="<%=request.getContextPath()%>/css/zxbgstyle.css" rel="stylesheet" />
</head>
<body class="bgbj">
	<div class="rightbg">
		<div class="bgposition">您现在的位置：代理商管理&gt;商户信息管理</div>
		<s:form method="post">
			<s:hidden id="iwoid" name="dealerVO.iwoid"/>
			<s:hidden id="dealerOid" name="dealerOid"/>
			<s:hidden id="coreDataFlag" name="dealerVO.coreDataFlag"/>
			<s:hidden id="partnerOid" name="partnerOid"/>
			<div class="bgtj">
				<ul class="tj_title">
					<li>查询条件</li>
				</ul>
				<ul class="bg_tjtab">
					<li class="bg_tjall">
						<table>
							<tbody>
								<tr>
									<th>状态</th>
									<td>
										<s:select list="#{1:'未使用',2:'使用中',3:'冻结'}" listKey="key" listValue="value" name="dealerVO.state"  id="state" headerKey="" headerValue="全部"/>
									</td>
									<th>手机号</th>
									<td><s:textfield name="dealerVO.moblieNumber" id="moblieNumber" maxlength="20"/></td>
									<th>登录名</th>
									<td><s:textfield name="dealerVO.loginId" id="loginId" maxlength="20"/></td>
									<th>公司</th>
									<td><s:textfield name="dealerVO.company" id="parentCompany" maxlength="20" /></td>
								</tr>
							</tbody>
						</table>
					</li>
					<li class="bg_button">
						<%-- 查看门店按钮权限，代理商、业务员都可在此页面查看门店，除了顶级服务商管理核心内容 --%>
			            <manage:permission validateUrl="/resources/partner/storemanage!listByDealerOid.action">
			        		<manage:pass>
			        			<s:set var="hasFindStoresPermission">yes</s:set>
			        		</manage:pass>
			        		<manage:notPass>
			        			<s:set var="hasFindStoresPermission">no</s:set>
			        		</manage:notPass>
			            </manage:permission>
			            
						<s:set var="findStoresFlag" value="true"/>
						<%-- 服务商有编辑商户核心信息的开关 --%>
						<s:if test="dealerVO != null && 'on' == dealerVO.coreDataFlag">
							<s:set var="findStoresFlag" value="false"/>
				            <manage:permission validateUrl="/resources/partner/dealermanage!goToUpdateDealerCore.action">
				        		<manage:pass>
				        			<s:set var="hasUpdateCorePermission">yes</s:set>
				        		</manage:pass>
				        		<manage:notPass>
				        			<s:set var="hasUpdateCorePermission">no</s:set>
				        		</manage:notPass>
				            </manage:permission>
						</s:if>
						<%-- 服务商向下钻取查看商户列表 --%>
						<s:elseif test="partnerOid != null && partnerOid != '' ">
							<%-- <s:set name="findStoresFlag" value="true"/> --%>
							<s:set var="backFlag" value="true"/>
						</s:elseif>
						<%-- 代理商查看自己发展的商户列表 --%>
						<s:elseif test="partnerOid == null || partnerOid == '' ">
							<manage:permission validateUrl="/resources/partner/dealermanage!goToCreateDealer.action">
				        		<manage:pass>
									<a href="javascript:void(0);" onclick="toCreateDealer()">添加商户</a>
				        		</manage:pass>
				            </manage:permission>
				            <manage:permission validateUrl="/resources/partner/dealermanage!goToUpdateDealer.action">
				        		<manage:pass>
				        			<s:set var="hasUpdatePermission">yes</s:set>
				        		</manage:pass>
				        		<manage:notPass>
				        			<s:set var="hasUpdatePermission">no</s:set>
				        		</manage:notPass>
				            </manage:permission>
				        	<%-- 代理商给自己推广的商户授权页 --%>    
				            <manage:permission validateUrl="/resources/partner/dealermanage!goToAlipayManage.action">
				        		<manage:pass>
				        			<s:set var="hasAlipayPermission">yes</s:set>
				        		</manage:pass>
				        		<manage:notPass>
				        			<s:set var="hasAlipayPermission">no</s:set>
				        		</manage:notPass>
				            </manage:permission>
						</s:elseif>
						<%--屏蔽商户级别二位码 --%>
			            <%-- <manage:permission validateUrl="/resources/partner/dealermanage!downloadPayQRCode.action">
			        		<manage:pass>
			        			<s:set var="hasDownQrCodePermission">yes</s:set>
			        		</manage:pass>
			        		<manage:notPass>
			        			<s:set var="hasDownQrCodePermission">no</s:set>
			        		</manage:notPass>
			            </manage:permission> --%>
						<a href="javascript:void(0);" onclick="invokeAction('list');">查询</a>
						<s:if test="backFlag">
							<a href="javascript:void(0);" onclick="history.back();">返回</a>
						</s:if>						
					</li>
				</ul>
			</div>
	    	<div class="bgtable">
	            <ul class="bg_all">
	                <li class="bg_table bg_table1">
	                    <table class="bg_odd">
	                        <thead>
	                            <tr>
	                                <th style="width: 40px;">序号</th>
	                                <th>商户编号</th>
	                                <th>登录名</th>
	                                <th>联系人</th>
	                                <th>公司名称</th>
	                                <!-- <th>所属代理商</th> -->
	                                <th>关联业务员</th>
	                                <th>固定电话</th>
	                                <th>手机</th>
	                                 <th>状态</th>
	                               	<!-- <th>技术支持联系人</th>
	                                <th>技术支持电话</th> -->
	                                <th class="twenty">操作</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        <s:if test="dealerVoList != null && dealerVoList.size() > 0">
			  					<s:iterator value="dealerVoList" var="dealerVo" status="rowStatus">
						  		<tr>
						  			<td>
						  				<s:property value="pageRows*(currPage-1) + #rowStatus.index + 1" />
						  			</td>
						  			<td title="<s:property value="#dealerVo.dealerId" />">
						  				<s:property value="#dealerVo.dealerId" />
						  			</td>
						  			<td title="<s:property value="#dealerVo.loginId" />">
						  				<s:property value="#dealerVo.loginId" />
						  			</td>
						  			<td title="<s:property value="#dealerVo.contactor" />">
						  				<s:property value="#dealerVo.contactor" />
						  			</td>
						  			<td title="<s:property value="#dealerVo.company" />">
						  				<s:property value="#dealerVo.company" />
						  			</td>
						  			<%-- <td title="<s:property value="#dealerVo.partnerCompany" />">
						  				<s:property value="#dealerVo.partnerCompany" />
						  			</td> --%>
						  			<td title="<s:property value="#dealerVo.partnerEmployeeName" />">
						  				<s:property value="#dealerVo.partnerEmployeeName" />
						  			</td>
						  			<td title="<s:property value="#dealerVo.telephone" />">
						  				<s:property value="#dealerVo.telephone" />
						  			</td>
						  			<td title="<s:property value="#dealerVo.moblieNumber" />">
						  				<s:property value="#dealerVo.moblieNumber" />
						  			</td>
						  			
						  			<s:if test="#dealerVo.state == 1">
						  				<s:set var="stateStr">未使用</s:set>
						  			</s:if>
						  			<s:elseif test="#dealerVo.state == 2">
						  				<s:set var="stateStr">使用中</s:set>
						  			</s:elseif>
						  			<s:elseif test="#dealerVo.state == 3">
						  				<s:set var="stateStr">冻结</s:set>
									</s:elseif>
						  			<td title="<s:property value="#stateStr" />">
						  				<s:property value="#stateStr" />
						  			</td>
						  			<%-- <td title="<s:property value="#dealerVo.techSupportPerson" />">
						  				<s:property value="#dealerVo.techSupportPerson" />
						  			</td>
						  			<td title="<s:property value="#dealerVo.techSupportPhone" />">
						  				<s:property value="#dealerVo.techSupportPhone" />
						  			</td> --%>
						  			<td title="操作">
	  									<s:if test="#hasUpdateCorePermission eq 'yes' && #dealerVo.state != 3">
						  					<a href="javascript:void(0);" onclick="toUpdateDealerCore('<s:property value="#dealerVo.iwoid" />')">修改</a>
						  				</s:if>
						  				<s:elseif test="#hasUpdatePermission eq 'yes' && #dealerVo.state != 3">
						  					<a href="javascript:void(0);" onclick="toUpdateDealer('<s:property value="#dealerVo.iwoid" />')">修改</a>
						  				</s:elseif>
						  				<s:if test="#findStoresFlag eq true && #hasFindStoresPermission eq 'yes'"> 
						  					<a href="<%=request.getContextPath()%>/resources/partner/storemanage!listByDealerOid.action?dealerOid=<s:property value="#dealerVo.iwoid" />" >查看门店</a>
						  				</s:if>
						  				<%-- <s:if test="#hasDownQrCodePermission eq 'yes'">
						  					<a href="javascript:void(0);" onclick="downloadPayQRCode('<s:property value="#dealerVo.iwoid" />')">下载二维码</a>
						  				</s:if> --%>
						  				<s:if test="#hasAlipayPermission eq 'yes' && #dealerVo.state != 3">
						  					<a href="javascript:void(0);" onclick="alipayManage('<s:property value="#dealerVo.iwoid" />')">支付宝管理</a>
						  				</s:if>
						  			</td>
						  		</tr>
						  		</s:iterator>
			  				</s:if>
					  		<s:else>
					  			<tr><td colspan="10">无符合条件的查询结果！</td></tr>
					  		</s:else>
	                    	</tbody>
	               		</table>
	                </li>
	            </ul>
				<ul>
	            	<li class="t-center">
	                	<s:include value="/resources/include/noPage.jsp"></s:include>
	                </li>
	            </ul>
	    	</div>
	    </s:form>
	</div>
	<s:property value="#request.messageBean.alertMessage" escape="false" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript">
		function toCreateDealer(){
			invokeAction('goToCreateDealer');
		}
		function toUpdateDealer(iwoid){
			$("#iwoid").val(iwoid);
			invokeAction('goToUpdateDealer');
		}
		function toUpdateDealerCore(iwoid){
			$("#iwoid").val(iwoid);
			invokeAction('goToUpdateDealerCore');
		}
		function downloadPayQRCode(iwoid){
			$("#dealerOid").val(iwoid);
			invokeAction('downloadPayQRCode');
		}
		
		function alipayManage(iwoid){
			$("#dealerOid").val(iwoid);
			invokeAction('goToAlipayManage');
		}
	</script>
	
</body>
</html>