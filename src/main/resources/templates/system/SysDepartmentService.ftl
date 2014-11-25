package ${packageName}.hibernate.service.sys;

import cn.wzga.core.hibernate.service.base.BaseService;
import ${packageName}.hibernate.entity.sys.SysDepartment;


public interface SysDepartmentService extends BaseService<SysDepartment> {
	/**
	 * 根据代码获取单位
	 * @param deptCode
	 * @return
	 */
	public SysDepartment findByCode(String deptCode);
}
