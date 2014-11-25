package ${packageName}.dao.impl;

import org.springframework.stereotype.Repository;

import cn.wzga.core.dao.base.impl.BaseDaoImpl;
import ${packageName}.dao.${className}Dao;
import ${packageName}.entity.${className};

@Repository("${className?uncap_first}Dao")
public class ${className}DaoImpl extends BaseDaoImpl<${className}> implements ${className}Dao{

}
