package ${packageName}.hibernate.dao.sys.impl;

import org.springframework.stereotype.Repository;

import cn.wzga.core.hibernate.dao.base.impl.BaseDaoImpl;
import ${packageName}.hibernate.dao.sys.SysLoginLogDao;
import ${packageName}.hibernate.entity.sys.SysLoginLog;


@Repository("sysLoginLogDao")
public class SysLoginLogDaoImpl extends BaseDaoImpl<SysLoginLog> implements SysLoginLogDao{

}
