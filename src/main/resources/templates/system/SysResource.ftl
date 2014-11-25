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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@SuppressWarnings("serial")
@Entity
@Table(name = "sys_resource")
public class SysResource implements Serializable {
	private Long id;
	private String name;// 名称
	private String url;// 网址
	private Integer type;// 类别（1：菜单，2。功能）
	private Integer resLevel;// 资源级别
	private Integer sort;// 排序
	private Integer state;// 伪删除状态（1：正常，2：删除
	private SysResource parent;
	private Set<SysResource> childList;
	protected String parentId;// parent id
	private SysUser creator;// 创建人
	private Date createDate;// 创建时间
	private SysUser modifyMan;// 修改人
	private Date modifyDate;// 修改时间

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "s_sys_resource")
	@SequenceGenerator(name = "s_sys_resource", sequenceName = "s_sys_resource", allocationSize = 1)
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

	@Column(name = "url")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "type")
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(name = "res_level")
	public Integer getResLevel() {
		return resLevel;
	}

	public void setResLevel(Integer resLevel) {
		this.resLevel = resLevel;
	}

	@Column(name = "sort")
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Column(name = "state")
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	public SysResource getParent() {
		return parent;
	}

	public void setParent(SysResource parent) {
		this.parent = parent;
	}

	@OneToMany(mappedBy = "parent", fetch = FetchType.LAZY)
	public Set<SysResource> getChildList() {
		return childList;
	}

	public void setChildList(Set<SysResource> childList) {
		this.childList = childList;
	}

	@Transient
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
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

}
