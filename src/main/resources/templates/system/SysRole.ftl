package ${packageName}.hibernate.entity.sys;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

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

@SuppressWarnings("serial")
@Entity
@Table(name = "sys_role")
public class SysRole implements Serializable {
	private Long id;// 关键字
	private String name;// 名称
	private String remark;// 备注
	private SysUser creator;// 创建人
	private Date createDate;// 创建时间
	private SysUser modifyMan;// 修改人
	private Date modifyDate;// 修改时间
	private Integer state;// 伪删除

	private Set<SysResource> resourceList;// 权限列表

	@Id
	@SequenceGenerator(name = "s_sys_role", sequenceName = "s_sys_role", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "s_sys_role")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "remark")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "state")
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "creator")
	public SysUser getCreator() {
		return creator;
	}

	public void setCreator(SysUser creator) {
		this.creator = creator;
	}

	@Column(name = "create_date")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "modify_man")
	public SysUser getModifyMan() {
		return modifyMan;
	}

	public void setModifyMan(SysUser modifyMan) {
		this.modifyMan = modifyMan;
	}

	@Column(name = "modify_date")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	@ManyToMany
	@JoinTable(name = "sys_role_resource", joinColumns = { @JoinColumn(name = "role_id", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "res_id", referencedColumnName = "id") })
	public Set<SysResource> getResourceList() {
		return resourceList;
	}

	public void setResourceList(Set<SysResource> resourceList) {
		this.resourceList = resourceList;
	}

}
