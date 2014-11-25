package ${packageName}.hibernate.service.sys;

import cn.wzga.core.hibernate.service.base.BaseService;
import ${packageName}.hibernate.entity.sys.SysUser;


public interface SysUserService extends BaseService<SysUser> {
	/**
	 * 通过用户名密码登录
	 * @param loginName
	 * @param password
	 * @return
	 */
	public SysUser findByLoginNamePassword(String loginName,String password);
	
	/**
	 * 通过身份证登录
	 * @param idcard
	 * @return
	 */
	public SysUser findByIdcard(String idcard);
	/**
	 * 注册用户带日志
	 * @param sysUser
	 * @param ip
	 */
	public void addWithLog(SysUser sysUser,String ip);
}
