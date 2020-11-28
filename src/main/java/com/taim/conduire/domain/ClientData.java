package com.taim.conduire.domain;


import javax.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "client")
public class ClientData implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Access(AccessType.PROPERTY)
    @Column(name = "client_id")
    private Integer clientId;

    @Column(name = "first_name")
    private String firstName;
    
    @Column(name = "last_name")
    private String lastName;
    
    @Column(name = "email_id")
    private String emailId;
    
    @Column(name = "password")
    private String password;

    @Column(name = "phone_number")
    private String phoneNumber;
    
    @Column(name = "blood_group")
    private String bloodGroup;
    
    @Column(name = "blood_donation_count")
    private Integer bloodDonationCount;
    
    @Column(name = "sign_up_date")
    private String signUpDate;
    
    @Column(name = "birth_date")
    private String birthDate;
    
    @Column(name = "aadhar_number")
    private String aadharNumber;

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

	public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public Integer getBloodDonationCount() {
		return bloodDonationCount;
	}

	public void setBloodDonationCount(Integer bloodDonationCount) {
		this.bloodDonationCount = bloodDonationCount;
	}

	public String getSignUpDate() {
		return signUpDate;
	}

	public void setSignUpDate(String signUpDate) {
		this.signUpDate = signUpDate;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getAadharNumber() {
		return aadharNumber;
	}

	public void setAadharNumber(String aadharNumber) {
		this.aadharNumber = aadharNumber;
	}

	@Override
	public String toString() {
		return "ClientData [clientId=" + clientId + ", firstName=" + firstName + ", lastName=" + lastName + ", emailId="
				+ emailId + ", password=" + password + ", phoneNumber=" + phoneNumber + ", bloodGroup=" + bloodGroup
				+ ", bloodDonationCount=" + bloodDonationCount + ", signUpDate=" + signUpDate + ", birthDate="
				+ birthDate + ", aadharNumber=" + aadharNumber + ", status=" + status + ", area=" + area + "]";
	}
}