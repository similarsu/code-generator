package ${packageName}.hibernate.dao.sys.impl;

import org.springframework.stereotype.Repository;

import cn.wzga.core.hibernate.dao.base.impl.BaseDaoImpl;
import ${packageName}.hibernate.dao.sys.SysLogDao;
import ${packageName}.hibernate.entity.sys.SysLog;


@Repository("sysLogDao")
public class SysLogDaoImpl extends BaseDaoImpl<SysLog> implements SysLogDao{

}
