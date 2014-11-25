package ${packageName}.hibernate.entity.sys;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
@Entity
@Table(name = "sys_log")
public class SysLog implements Serializable {
	private Long id;
	private String idcard;// 身份证
	private String name;// 姓名
	private Date operateDate;// 操作时间
	private String operateModule;// 操作方式
	private String operateContent;// 操作内容
	private String ip;// 客户端ip

	@Id
	@SequenceGenerator(name = "s_sys_log", sequenceName = "s_sys_log", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "s_sys_log")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "idcard")
	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "operate_date")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getOperateDate() {
		return operateDate;
	}

	public void setOperateDate(Date operateDate) {
		this.operateDate = operateDate;
	}

	@Column(name = "operate_module")
	public String getOperateModule() {
		return operateModule;
	}

	public void setOperateModule(String operateModule) {
		this.operateModule = operateModule;
	}

	@Column(name = "operate_content")
	public String getOperateContent() {
		return operateContent;
	}

	public void setOperateContent(String operateContent) {
		this.operateContent = operateContent;
	}

	@Column(name = "ip")
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
