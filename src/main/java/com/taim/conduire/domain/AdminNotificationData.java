//POJO

package com.taim.conduire.domain;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "admin_notifications")
public class AdminNotificationData implements Serializable {
    private static final long serialVersionUID = 1L;


    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Access(AccessType.PROPERTY)
    @Column(name = "notification_id")
    private Integer notificationId;

    @Column(name = "notification_data")
    private String notificationData;

    @Column(name = "creation_date")
    private String creationDate;
    
    @Column(name = "type")
    private String type;
    
    @Column(name = "status_admin")
    private Integer statusAdmin;
    
    @Column(name = "creation_time")
    private String creationTime;
    
    @Column(name = "sender")
    private String sender;
    
	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}

	public Integer getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(Integer notificationId) {
		this.notificationId = notificationId;
	}

	public String getNotificationData() {
		return notificationData;
	}

	public void setNotificationData(String notificationData) {
		this.notificationData = notificationData;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getStatusAdmin() {
		return statusAdmin;
	}

	public void setStatusAdmin(Integer statusAdmin) {
		this.statusAdmin = statusAdmin;
	}

	@Override
	public String toString() {
		return "AdminNotificationData [notificationId=" + notificationId + ", notificationData=" + notificationData
				+ ", creationDate=" + creationDate + ", type=" + type + ", statusAdmin=" + statusAdmin
				+  ", creationTime=" + creationTime + ", sender=" + sender + "]";
	}

    
   }
