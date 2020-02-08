package com.taim.conduire.domain;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

@Entity
@Table(name = "tasks")
@XmlRootElement
public class Tasks implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    @Access(AccessType.PROPERTY)
    private Integer id;

    @Basic(optional = false)
    @Column(name = "name")
    private String name;

    @Basic(optional = false)
    @Column(name = "status")
    private String status;

    @Basic(optional = false)
    @Column(name = "description")
    private String description;

    @Basic(optional = false)
    @Column(name = "interval_time")
    private String intervalTime;

    @Basic(optional = false)
    @Column(name = "class")
    private String class1;

    @Basic(optional = false)
    @Column(name = "parameter")
    private String parameter;

    public Tasks() {
    }

    public Tasks(Integer id) {
        this.id = id;
    }

    public Tasks(Integer id, String name, String status, String intervalTime, String class1, String parameter, String taskscol) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.intervalTime = intervalTime;
        this.class1 = class1;
        this.parameter = parameter;
    }

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIntervalTime() {
        return intervalTime;
    }

    public void setIntervalTime(String intervalTime) {
        this.intervalTime = intervalTime;
    }

    public String getClass1() {
        return class1;
    }

    public void setClass1(String class1) {
        this.class1 = class1;
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }


    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Tasks)) {
            return false;
        }
        Tasks other = (Tasks) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.apipartner.entities.Tasks[ id=" + id + " ]";
    }

}
