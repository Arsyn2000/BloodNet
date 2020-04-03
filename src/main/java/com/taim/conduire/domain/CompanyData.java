package com.taim.conduire.domain;


import javax.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "company")
public class CompanyData implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Access(AccessType.PROPERTY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "alias")
    private String alias;

    @Column(name = "description")
    private String description;
    
    @Column(name = "url")
    private String url;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "phone")
    private String phone;
    
    @Column(name = "fax")
    private String fax;
    
    @Column(name = "logo_image")
    private String logoImage;
    
    @Column(name = "address")
    private String address;
    
    @Column(name = "base_discount")
    private Double baseDiscount;
    
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    
    @Column(name = "status")
    private String status;

    @Column(name = "last_modified_by")
    private Integer lastModifiedBy;

    @Column(name = "modified_timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedTimestamp;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getLogoImage() {
		return logoImage;
	}

	public void setLogoImage(String logoImage) {
		this.logoImage = logoImage;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCreateDate() {
		return createDate;
	}
	
	public Double getBaseDiscount() {
		return baseDiscount;
	}

	public void setBaseDiscount(Double baseDiscount) {
		this.baseDiscount = baseDiscount;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public Date getModifiedTimestamp() {
		return modifiedTimestamp;
	}

	public void setModifiedTimestamp(Date modifiedTimestamp) {
		this.modifiedTimestamp = modifiedTimestamp;
	}

	@Override
	public String toString() {
		return "CompanyData [id=" + id + ", name=" + name + ", alias=" + alias + ", description=" + description
				+ ", url=" + url + ", email=" + email + ", phone=" + phone + ", fax=" + fax + ", logoImage=" + logoImage
				+ ", address=" + address + ", baseDiscount=" + baseDiscount + ", createDate=" + createDate + ", status="
				+ status + ", lastModifiedBy=" + lastModifiedBy + ", modifiedTimestamp=" + modifiedTimestamp + "]";
	}
}
