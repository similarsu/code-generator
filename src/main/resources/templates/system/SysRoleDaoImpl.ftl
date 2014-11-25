package ${packageName}.hibernate.dao.sys.impl;

import org.springframework.stereotype.Repository;

import cn.wzga.core.hibernate.dao.base.impl.BaseDaoImpl;
import ${packageName}.hibernate.dao.sys.SysRoleDao;
import ${packageName}.hibernate.entity.sys.SysRole;


@Repository("sysRoleDao")
public class SysRoleDaoImpl extends BaseDaoImpl<SysRole> implements SysRoleDao{

}
