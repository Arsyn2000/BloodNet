package com.taim.conduire.domain;


import javax.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "hospital")
public class HospitalData implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Access(AccessType.PROPERTY)
    @Column(name = "hospital_id")
    private Integer hospitalId;

    @Column(name = "name")
    private String name;
    
    @Column(name = "email_id")
    private String emailId;
    
    @Column(name = "password")
    private String password;

    @Column(name = "phone_number")
    private String phoneNumber;
    
    @Column(name = "qty_a")
    private Float qtyA;
    
    @Column(name = "qty_b")
    private Float qtyB;
    
    @Column(name = "qty_ab")
    private Float qtyAb;
    
    @Column(name = "qty_o")
    private Float qtyO;
    
    @Column(name = "sign_up_date")
    private String signUpDate;

    @Column(name = "status")
    private String status;
    
    @Column(name = "area")
    private String area;
    
    
    
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSignUpDate() {
		return signUpDate;
	}

	public void setSignUpDate(String signUpDate) {
		this.signUpDate = signUpDate;
	}

	public Integer getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(Integer hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Float getQtyA() {
		return qtyA;
	}

	public void setQtyA(Float qtyA) {
		this.qtyA = qtyA;
	}

	public Float getQtyB() {
		return qtyB;
	}

	public void setQtyB(Float qtyB) {
		this.qtyB = qtyB;
	}

	public Float getQtyAb() {
		return qtyAb;
	}

	public void setQtyAb(Float qtyAb) {
		this.qtyAb = qtyAb;
	}

	public Float getQtyO() {
		return qtyO;
	}

	public void setQtyO(Float qtyO) {
		this.qtyO = qtyO;
	}

	@Override
	public String toString() {
		return "HospitalData [hospitalId=" + hospitalId + ", name=" + name + ", emailId=" + emailId + ", password="
				+ password + ", phoneNumber=" + phoneNumber + ", qtyA=" + qtyA + ", qtyB=" + qtyB + ", qtyAb=" + qtyAb
				+ ", qtyO=" + qtyO + ", signUpDate=" + signUpDate + ", status=" + status + ", area=" + area + "]";
	}
}