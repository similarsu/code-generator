package ${packageName}.hibernate.service.sys.impl;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wzga.core.hibernate.service.base.impl.BaseServiceImpl;
import ${packageName}.hibernate.dao.sys.SysLogDao;
import ${packageName}.hibernate.entity.sys.SysLog;
import ${packageName}.hibernate.service.sys.SysLogService;


@Service("sysLogService")
@Transactional
public class SysLogServiceImpl extends BaseServiceImpl<SysLog> implements SysLogService {
	@Resource(name="sysLogDao")
	private SysLogDao sysLogDao;

	@PostConstruct
	public void injectBaseDao() {
		super.injectBaseDao(sysLogDao);
	}
}
