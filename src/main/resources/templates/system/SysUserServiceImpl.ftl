package ${packageName}.hibernate.service.sys.impl;


import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wzga.core.hibernate.dao.base.support.Join;
import cn.wzga.core.hibernate.dao.base.support.Where;
import cn.wzga.core.hibernate.service.base.impl.BaseServiceImpl;
import ${packageName}.hibernate.dao.sys.SysLoginLogDao;
import ${packageName}.hibernate.dao.sys.SysUserDao;
import ${packageName}.hibernate.entity.sys.SysLoginLog;
import ${packageName}.hibernate.entity.sys.SysResource;
import ${packageName}.hibernate.entity.sys.SysRole;
import ${packageName}.hibernate.entity.sys.SysUser;
import ${packageName}.hibernate.service.sys.SysUserService;


@Service("sysUserService")
public class SysUserServiceImpl extends BaseServiceImpl<SysUser> implements SysUserService {
	@Resource(name="sysUserDao")
	private SysUserDao sysUserDao;
	
	@Resource(name="sysLoginLogDao")
	private SysLoginLogDao sysLoginLogDao;

	@PostConstruct
	public void injectBaseDao() {
		super.injectBaseDao(sysUserDao);
	}

	@Override
	@Transactional(readOnly=true)
	public SysUser findByLoginNamePassword(String loginName, String password) {
		// TODO Auto-generated method stub
		SysUser sysUser=sysUserDao.find(Where.getInstance().equal("sysUser.loginName", loginName).equal("sysUser.password", password),Join.getInstance().join("sysDepartment"));
		if(sysUser!=null){
			Set<SysRole> roleList=sysUser.getRoleList();
			Set<SysResource> resList=new LinkedHashSet<SysResource>();
			if(roleList!=null){
				for(SysRole sysRole:roleList){
					
					Set<SysResource> sysResourceList=sysRole.getResourceList();
					if(sysResourceList!=null){
						for(SysResource sysResource:sysResourceList){
							resList.add(sysResource);
						}
					}
					
				}
			}
			sysUser.setResourceList(resList);
			
		}
		return sysUser;
	}

	@Override
	public SysUser findByIdcard(String idcard) {
		// TODO Auto-generated method stub
		SysUser sysUser=sysUserDao.find(Where.getInstance().equal("sysUser.idcard", idcard),Join.getInstance().join("sysDepartment"));
		if(sysUser!=null){
			Set<SysRole> roleList=sysUser.getRoleList();
			Set<SysResource> resList=new LinkedHashSet<SysResource>();
			if(roleList!=null){
				for(SysRole sysRole:roleList){
					
					Set<SysResource> sysResourceList=sysRole.getResourceList();
					if(sysResourceList!=null){
						for(SysResource sysResource:sysResourceList){
							resList.add(sysResource);
						}
					}
					
				}
			}
			sysUser.setResourceList(resList);
			
		}
		return sysUser;
	}

	@Override
	public void addWithLog(SysUser sysUser,String ip) {
		// TODO Auto-generated method stub
		sysUserDao.save(sysUser);
		SysLoginLog sysLoginLog=new SysLoginLog();
		sysLoginLog.setIdcard(sysUser.getIdcard());
		sysLoginLog.setName(sysUser.getChineseName());
		sysLoginLog.setLogDate(new Date());
		sysLoginLog.setIp(ip);
		sysLoginLog.setStatus(4);
		sysLoginLogDao.save(sysLoginLog);
	}

}
