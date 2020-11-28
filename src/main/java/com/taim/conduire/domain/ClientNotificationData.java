//POJO

package com.taim.conduire.domain;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "client_notification")
public class ClientNotificationData implements Serializable {
    private static final long serialVersionUID = 1L;


    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Access(AccessType.PROPERTY)
    @Column(name = "cnotification_id")
    private Integer cnotificationId;
    
    @Column(name = "receiver")
    private String receiver;
    
    @Column(name = "sender")
    private String sender;

    @Column(name = "data")
    private String data;
    
    @Column(name = "type")
    private String type;
    
    @Column(name = "status")
    private Integer status;

    @Column(name = "creation_date")
    private String creationDate;
    
    @Column(name = "creation_time")
    private String creationTime;

	public Integer getCnotificationId() {
		return cnotificationId;
	}

	public void setCnotificationId(Integer cnotificationId) {
		this.cnotificationId = cnotificationId;
	}
	
	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}

	@Override
	public String toString() {
		return "HospitalNotificationData [cnotificationId=" + cnotificationId + ", receiver=" + receiver + ", sender="
				+ sender + ", data=" + data + ", type=" + type + ", status=" + status + ", creationDate=" + creationDate
				+ ", creationTime=" + creationTime + "]";
	}

	
   }
