package com.zbsp.wepaysp.service.partner;

import java.util.List;
import java.util.Map;

import com.zbsp.wepaysp.common.exception.AlreadyExistsException;
import com.zbsp.wepaysp.vo.partner.PartnerEmployeeVO;

/**
 * 服务商（代理商）员工Service
 */
public interface PartnerEmployeeService {
    
    /**
     * 根据主键查询服务商（代理商）员工信息.
     * 
     * @param partnerEmployeeOid 服务商（代理商）员工Oid
     * @return 服务商（代理商）员工对象
     */
    public PartnerEmployeeVO doJoinTransQueryPartnerEmployeeByOid(String partnerEmployeeOid);
	
    /**
     * 查询符合条件的列表，查询结果按最后修改时间倒序排列.
     * 查询参数Map中key的取值如下：
     * <pre>
     *      employeeName:     String类型，服务商（代理商）员工姓名，根据此参数模糊查询
     *      moblieNumber:         String类型，服务商（代理商）员工手机号，根据此参数精确查询
     * </pre>
     * 
     * @param paramMap 查询参数
     * @param startIndex 记录起始位置
     * @param maxResult 返回记录最大数
     * @return 符合条件的信息列表
     */
    public List<PartnerEmployeeVO> doJoinTransQueryPartnerEmployeeList(Map<String, Object> paramMap, int startIndex, int maxResult);
    
    /**
     * 统计符合条件的总数.
     * 查询参数Map中key的取值如下：
     * <pre>
     *      employeeName:     String类型，服务商（代理商）员工姓名，根据此参数模糊查询
     *      moblieNumber:         String类型，服务商（代理商）员工手机号，根据此参数精确查询
     * </pre>
     * 
     * @param paramMap 查询参数
     * @return 符合条件的信息总数
     */
    public int doJoinTransQueryPartnerEmployeeCount(Map<String, Object> paramMap);
    
    /**
     * 创建服务商（代理商）员工，同时创建关联员工的用户
     * 
     * @param partnerEmployeeVO 要保存的服务商（代理商）员工对象 
     * @param creator 创建人名称
     * @param operatorUserOid 操作用户Oid
     * @param logFunctionOid 日志记录项Oid
     * @return 保存成功返回保存后的服务商（代理商）员工对象VO
     * @throws AlreadyExistsException 如果服务商（代理商）员工登录名已存在
     */
    public PartnerEmployeeVO doTransAddPartnerEmployee(PartnerEmployeeVO partnerEmployeeVO, String creator, String operatorUserOid, String logFunctionOid)
        throws AlreadyExistsException, IllegalAccessException;
    
    /**
     * 修改服务商（代理商）员工.
     * 
     * @param partnerEmployeeVO 要修改的服务商（代理商）员工对象
     * @param modifier 修改人名称
     * @param operatorUserOid 操作用户Oid
     * @param logFunctionOid 日志记录项Oid
     * @return 修改成功返回修改后的服务商（代理商）员工对象VO
     * @throws AlreadyExistsException 如果服务商（代理商）员工登录名已存在
     */
    public PartnerEmployeeVO doTransUpdatePartnerEmployee(PartnerEmployeeVO partnerEmployeeVO, String modifier, String operatorUserOid, String logFunctionOid)
        throws AlreadyExistsException;
    
    
}
