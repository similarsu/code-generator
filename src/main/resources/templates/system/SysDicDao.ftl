package ${packageName}.hibernate.dao.sys;

import java.util.List;

import cn.wzga.core.hibernate.dao.base.BaseDao;
import ${packageName}.hibernate.entity.sys.SysDic;


public interface SysDicDao  extends BaseDao<SysDic>{

	List<SysDic> findGroup();

	void updateType(String oldType, String newType, String newTypeDesc);

}
