/*
 * ManageUser.java
 * 创建者：杨帆
 * 创建日期：2015年6月7日
 *
 * 版权所有(C) 2011-2014。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */
package com.zbsp.wepaysp.manage.web.security;

import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;


/**
 * 后台管理用户对象
 * 
 * @author 杨帆
 */
public class ManageUser extends User {

    private static final long serialVersionUID = 8775062173930320434L;

    private String iwoid;

    private String userId;

    private String loginToken;
    
    private Integer dataPermissionType;
    
    private String lastLoginIp;
    
    private Date lastLoginTime;
    
    private String roleIndex;

    public ManageUser(String iwoid, String userId, String username, String password, String loginToken, Integer dataPermissionType,
            String lastLoginIp, Date lastLoginTime, String roleIndex, boolean enabled, boolean accountNonExpired,
            boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.iwoid = iwoid;
        this.userId = userId;
        this.loginToken = loginToken;
        this.dataPermissionType = dataPermissionType;
        this.lastLoginIp = lastLoginIp;
        this.lastLoginTime = lastLoginTime;
        this.roleIndex = roleIndex;
    }

    public String getLoginToken() {
        return loginToken;
    }

    public void setLoginToken(String loginToken) {
        this.loginToken = loginToken;
    }

    public Integer getDataPermissionType() {
        return dataPermissionType;
    }

    public void setDataPermissionType(Integer dataPermissionType) {
        this.dataPermissionType = dataPermissionType;
    }
    
    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getIwoid() {
        return iwoid;
    }

    public void setIwoid(String iwoid) {
        this.iwoid = iwoid;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoleIndex() {
		return roleIndex;
	}

	public void setRoleIndex(String roleIndex) {
		this.roleIndex = roleIndex;
	}

	@Override
    public int hashCode() {
        return this.iwoid.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof ManageUser) {
            return this.iwoid.equals(((ManageUser) obj).getIwoid());
        }
        return false;
    }
}
