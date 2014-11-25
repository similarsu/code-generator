package ${packageName}.hibernate.service.sys.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wzga.core.hibernate.service.base.impl.BaseServiceImpl;
import ${packageName}.hibernate.dao.sys.SysDicDao;
import ${packageName}.hibernate.entity.sys.SysDic;
import ${packageName}.hibernate.service.sys.SysDicService;


@Service("sysDicService")
@Transactional
public class SysDicServiceImpl extends BaseServiceImpl<SysDic> implements SysDicService {
	@Resource(name="sysDicDao")
	private SysDicDao sysDicDao;

	@PostConstruct
	public void injectBaseDao() {
		super.injectBaseDao(sysDicDao);
	}

	@Override
	public List<SysDic> findGroup() {
		// TODO Auto-generated method stub
		return sysDicDao.findGroup();
	}

	@Override
	public void deleteAndAdd(Serializable id, SysDic sysDic) {
		// TODO Auto-generated method stub
		sysDicDao.deleteById(id);
		sysDicDao.save(sysDic);
	}

	@Override
	public void updateType(String oldType, String newType, String newTypeDesc) {
		// TODO Auto-generated method stub
		sysDicDao.updateType(oldType,newType,newTypeDesc);
	}

}
