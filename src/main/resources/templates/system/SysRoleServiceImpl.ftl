package ${packageName}.hibernate.service.sys.impl;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wzga.core.hibernate.service.base.impl.BaseServiceImpl;
import ${packageName}.hibernate.dao.sys.SysRoleDao;
import ${packageName}.hibernate.entity.sys.SysRole;
import ${packageName}.hibernate.service.sys.SysRoleService;


@Service("sysRoleService")
@Transactional
public class SysRoleServiceImpl extends BaseServiceImpl<SysRole> implements SysRoleService {
	@Resource(name="sysRoleDao")
	private SysRoleDao sysRoleDao;

	@PostConstruct
	public void injectBaseDao() {
		super.injectBaseDao(sysRoleDao);
	}
}
