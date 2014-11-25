package ${packageName}.hibernate.dao.sys.impl;

import org.springframework.stereotype.Repository;

import cn.wzga.core.hibernate.dao.base.impl.BaseDaoImpl;
import ${packageName}.hibernate.dao.sys.SysUserDao;
import ${packageName}.hibernate.entity.sys.SysUser;


@Repository("sysUserDao")
public class SysUserDaoImpl extends BaseDaoImpl<SysUser> implements SysUserDao{

}
