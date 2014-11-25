package ${packageName}.hibernate.entity.sys;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "sys_department")
public class SysDepartment implements Serializable {
	private Long id;// 关键字
	private String deptCode;// 单位代码
	private String deptName;// 单位名称
	private String deptSpell;// 单位拼音
	private Integer deptLevel;// 单位层次

	@Id
	@SequenceGenerator(name = "s_sys_department", sequenceName = "s_sys_department", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "s_sys_department")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "dept_code")
	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	@Column(name = "dept_name")
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Column(name = "dept_spell")
	public String getDeptSpell() {
		return deptSpell;
	}

	public void setDeptSpell(String deptSpell) {
		this.deptSpell = deptSpell;
	}

	@Column(name = "dept_level")
	public Integer getDeptLevel() {
		return deptLevel;
	}

	public void setDeptLevel(Integer deptLevel) {
		this.deptLevel = deptLevel;
	}

}
