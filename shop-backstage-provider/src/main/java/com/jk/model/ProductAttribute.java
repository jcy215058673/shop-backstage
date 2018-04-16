package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ProductAttribute implements Serializable{
    private static final long serialVersionUID = 3878855112596539297L;
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private Long orders;

    private String name;

    private Long propertyIndex;

    private BigDecimal productCategory;

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

    public BigDecimal getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(BigDecimal productCategory) {
        this.productCategory = productCategory;
    }
}