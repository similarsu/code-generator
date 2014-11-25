package ${packageName}.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@SuppressWarnings("serial")
@Entity
@Table(name = "${tableName}")
public class ${className} implements Serializable {
	<#list columns as column>
	private ${column.propType} ${column.propName};//${column.comment!}
	</#list>
	
	<#list columns as column>
	<#if column.isPrivate==1>
	@Id
	@SequenceGenerator(name = "s_${tableName}", sequenceName = "s_${tableName}", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "s_${tableName}")
	public ${column.propType} get${column.propName?cap_first}() {
		return ${column.propName};
	}
	<#elseif column.propType=="Date">
	@Column(name = "${column.columnName}")
	@Temporal(TemporalType.TIMESTAMP)
	public ${column.propType} get${column.propName?cap_first}() {
		return ${column.propName};
	}
	<#else>
	@Column(name = "${column.columnName}")
	public ${column.propType} get${column.propName?cap_first}() {
		return ${column.propName};
	}
	</#if>
	public void set${column.propName?cap_first}(${column.propType} ${column.propName}) {
		this.${column.propName} = ${column.propName};
	}
	</#list>
}
