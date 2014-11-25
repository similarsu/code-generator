package ${packageName}.service.impl;


import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wzga.core.service.base.impl.BaseServiceImpl;
import ${packageName}.dao.${className}Dao;
import ${packageName}.entity.${className};
import ${packageName}.service.${className}Service;

@Service("${className?uncap_first}Service")
@Transactional
public class ${className}ServiceImpl extends BaseServiceImpl<${className}> implements ${className}Service{
	@Resource(name="${className?uncap_first}Dao")
	private ${className}Dao ${className?uncap_first}Dao;
	
	@PostConstruct
	public void injectBaseDao() {
		super.injectBaseDao(${className?uncap_first}Dao);
	}
}
