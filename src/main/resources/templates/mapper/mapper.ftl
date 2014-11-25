package ${packageName}.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("${className?uncap_first}Mapper")
public interface ${className}Mapper {
	public List<${className}> findAll(${className} ${className?uncap_first});
	public void add(${className} ${className?uncap_first});
	public void delete(Long id);
	public void update(${className} ${className?uncap_first});
	public ${className} load(Long id);
	public int getCount(${className} ${className?uncap_first});
}
