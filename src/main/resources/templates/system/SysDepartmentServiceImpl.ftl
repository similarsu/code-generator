package ${packageName}.hibernate.service.sys.impl;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wzga.core.hibernate.dao.base.support.Where;
import cn.wzga.core.hibernate.service.base.impl.BaseServiceImpl;
import ${packageName}.hibernate.dao.sys.SysDepartmentDao;
import ${packageName}.hibernate.entity.sys.SysDepartment;
import ${packageName}.hibernate.service.sys.SysDepartmentService;


@Service("sysDepartmentService")
@Transactional
public class SysDepartmentServiceImpl extends BaseServiceImpl<SysDepartment> implements SysDepartmentService {
	@Resource(name="sysDepartmentDao")
	private SysDepartmentDao sysDepartmentDao;

	@PostConstruct
	public void injectBaseDao() {
		super.injectBaseDao(sysDepartmentDao);
	}

	@Override
	public SysDepartment findByCode(String deptCode) {
		// TODO Auto-generated method stub
		return sysDepartmentDao.find(Where.getInstance().equal("sysDepartment.deptCode", deptCode));
	}
}
