package ${packageName}.hibernate.service.sys.impl;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wzga.core.hibernate.service.base.impl.BaseServiceImpl;
import ${packageName}.hibernate.dao.sys.SysLoginLogDao;
import ${packageName}.hibernate.entity.sys.SysLoginLog;
import ${packageName}.hibernate.service.sys.SysLoginLogService;


@Service("sysLoginLogService")
@Transactional
public class SysLoginLogServiceImpl extends BaseServiceImpl<SysLoginLog> implements SysLoginLogService {
	@Resource(name="sysLoginLogDao")
	private SysLoginLogDao sysLoginLogDao;

	@PostConstruct
	public void injectBaseDao() {
		super.injectBaseDao(sysLoginLogDao);
	}
}
