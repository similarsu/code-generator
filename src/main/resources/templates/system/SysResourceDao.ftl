package ${packageName}.hibernate.dao.sys;

import java.io.Serializable;

import cn.wzga.core.hibernate.dao.base.BaseDao;
import ${packageName}.hibernate.entity.sys.SysResource;

public interface SysResourceDao extends BaseDao<SysResource>{

	void deleteRelation(Serializable id);

}
