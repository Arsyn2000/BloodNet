package com.taim.conduire.domain;


import javax.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "distributor")
public class DistributorData implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Access(AccessType.PROPERTY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "alias")
    private String alias;

    @Column(name = "address")
    private String address;
    
    @Column(name = "phone1")
    private String phone1;

    @Column(name = "phone2")
    private String phone2;
    
    @Column(name = "gstin")
    private String gstin;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "website")
    private String website;
    
    @Column(name = "contact_person")
    private String contactPerson;
    
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getGstin() {
		return gstin;
	}

	public void setGstin(String gstin) {
		this.gstin = gstin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public Date getCreateDate() {
		return createDate;
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
		return "DistributorData [id=" + id + ", name=" + name + ", alias=" + alias + ", address=" + address
				+ ", phone1=" + phone1 + ", phone2=" + phone2 + ", gstin=" + gstin + ", email=" + email + ", website="
				+ website + ", contactPerson=" + contactPerson + ", createDate=" + createDate + ", status=" + status
				+ ", lastModifiedBy=" + lastModifiedBy + ", modifiedTimestamp=" + modifiedTimestamp + "]";
	}

	
}
