package ${packageName}.hibernate.service.sys;

import java.io.Serializable;
import java.util.List;

import cn.wzga.core.hibernate.service.base.BaseService;
import ${packageName}.hibernate.entity.sys.SysDic;


public interface SysDicService extends BaseService<SysDic> {

	List<SysDic> findGroup();

	void deleteAndAdd(Serializable id, SysDic sysDic);

	void updateType(String oldType,String newType,String newTypeDesc);
	
}
