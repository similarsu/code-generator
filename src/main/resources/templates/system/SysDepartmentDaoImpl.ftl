package ${packageName}.hibernate.dao.sys.impl;

import org.springframework.stereotype.Repository;

import cn.wzga.core.hibernate.dao.base.impl.BaseDaoImpl;
import ${packageName}.hibernate.dao.sys.SysDepartmentDao;
import ${packageName}.hibernate.entity.sys.SysDepartment;


@Repository("sysDepartmentDao")
public class SysDepartmentDaoImpl extends BaseDaoImpl<SysDepartment> implements SysDepartmentDao{

}
