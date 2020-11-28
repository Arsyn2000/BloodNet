//POJO

package com.taim.conduire.domain;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "faq")
public class FaqData implements Serializable {
    private static final long serialVersionUID = 1L;


    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Access(AccessType.PROPERTY)
    private Integer id;

    @Column(name = "question")
    private String question;

    @Column(name = "answer")
    private String answer;

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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
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
		return "FaqData [id=" + id + ", question=" + question + ", answer=" + answer + ", createDate=" + createDate
				+ ", status=" + status + ", lastModifiedBy=" + lastModifiedBy + ", modifiedTimestamp="
				+ modifiedTimestamp + "]";
	}
    
    
    
}
