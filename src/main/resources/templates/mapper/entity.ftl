package ${packageName}.mapper;

import org.apache.ibatis.type.Alias;


@Alias("${className?uncap_first}")
public class ${className} {
    <#list columns as column>
	private ${column.propType} ${column.propName};//${column.comment!}
	</#list>
	
	<#list columns as column>
	public ${column.propType} get${column.propName?cap_first}() {
		return ${column.propName};
	}
	
	public void set${column.propName?cap_first}(${column.propType} ${column.propName}) {
		this.${column.propName} = ${column.propName};
	}
	</#list>

}
