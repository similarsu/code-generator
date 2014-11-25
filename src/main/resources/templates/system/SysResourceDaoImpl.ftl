package ${packageName}.hibernate.dao.sys.impl;

import java.io.Serializable;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import cn.wzga.core.hibernate.dao.base.impl.BaseDaoImpl;
import ${packageName}.hibernate.dao.sys.SysResourceDao;
import ${packageName}.hibernate.entity.sys.SysResource;


@Repository("sysResourceDao")
public class SysResourceDaoImpl extends BaseDaoImpl<SysResource> implements SysResourceDao{

	@Override
	public void deleteRelation(Serializable id) {
		// TODO Auto-generated method stub
		Session session=getSession();
		session.createSQLQuery("delete from sys_role_resource where res_id=?").setLong(0, (Long)id).executeUpdate();
	}

}
