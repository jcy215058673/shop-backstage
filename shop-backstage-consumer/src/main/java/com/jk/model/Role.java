package com.jk.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Role implements Serializable{
    private static final long serialVersionUID = 2518377110948491607L;
    private BigDecimal id;

    private String createDate;

    private String modifyDate;

    private String description;

    private Integer isSystem;

    private String name;

    private String hrmempIDS;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getIsSystem() {
        return isSystem;
    }

    public void setIsSystem(Integer isSystem) {
        this.isSystem = isSystem;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHrmempIDS() {
        return hrmempIDS;
    }

    public void setHrmempIDS(String hrmempIDS) {
        this.hrmempIDS = hrmempIDS;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", isSystem=" + isSystem +
                ", name='" + name + '\'' +
                ", hrmempIDS='" + hrmempIDS + '\'' +
                '}';
    }
}