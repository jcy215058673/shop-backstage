package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Hyzc implements Serializable{
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private Long orders;

    private Short isEnabled;

    private Short isRequired;

    private String name;

    private Long propertyIndex;

    private Long type;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public Long getOrders() {
        return orders;
    }

    public void setOrders(Long orders) {
        this.orders = orders;
    }

    public Short getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(Short isEnabled) {
        this.isEnabled = isEnabled;
    }

    public Short getIsRequired() {
        return isRequired;
    }

    public void setIsRequired(Short isRequired) {
        this.isRequired = isRequired;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getPropertyIndex() {
        return propertyIndex;
    }

    public void setPropertyIndex(Long propertyIndex) {
        this.propertyIndex = propertyIndex;
    }

    public Long getType() {
        return type;
    }

    public void setType(Long type) {
        this.type = type;
    }
}