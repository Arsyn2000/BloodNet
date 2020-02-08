/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.taim.conduire.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author prtk
 */
@Entity
@Table(name = "log_status")
@NamedQueries({
    @NamedQuery(name = "LogStatus.findAll", query = "SELECT l FROM LogStatus l"),
    @NamedQuery(name = "LogStatus.findById", query = "SELECT l FROM LogStatus l WHERE l.id = :id"),
    @NamedQuery(name = "LogStatus.findByPackageName", query = "SELECT l FROM LogStatus l WHERE l.packageName = :packageName"),
    @NamedQuery(name = "LogStatus.findByLoggingLevel", query = "SELECT l FROM LogStatus l WHERE l.loggingLevel = :loggingLevel")})
public class LogStatus implements Serializable {
    private static final long serialVersionUID = 1L;
    public static final String[] properties = {"id", "packageName", "loggingLevel"};
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "package_name")
    private String packageName;
    @Size(max = 30)
    @Column(name = "logging_level")
    private String loggingLevel;

    public LogStatus() {
    }

    public LogStatus(Integer id) {
        this.id = id;
    }

    public LogStatus(Integer id, String packageName) {
        this.id = id;
        this.packageName = packageName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getLoggingLevel() {
        return loggingLevel;
    }

    public void setLoggingLevel(String loggingLevel) {
        this.loggingLevel = loggingLevel;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LogStatus)) {
            return false;
        }
        LogStatus other = (LogStatus) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "getset.LogStatus[ id=" + id + " ]";
    }
    
}
