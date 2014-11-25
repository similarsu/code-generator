package ${packageName}.hibernate.service.sys.impl;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wzga.core.hibernate.service.base.impl.BaseServiceImpl;
import ${packageName}.hibernate.dao.sys.SysResourceDao;
import ${packageName}.hibernate.entity.sys.SysResource;
import ${packageName}.hibernate.service.sys.SysResourceService;


@Service("sysResourceService")
@Transactional
public class SysResourceServiceImpl extends BaseServiceImpl<SysResource> implements SysResourceService {
	@Resource(name="sysResourceDao")
	private SysResourceDao sysResourceDao;

	@PostConstruct
	public void injectBaseDao() {
		super.injectBaseDao(sysResourceDao);
	}
	
	@Override
	public void delete(Serializable id) {
		sysResourceDao.deleteRelation(id);
		sysResourceDao.deleteById(id);
	}
	
}
