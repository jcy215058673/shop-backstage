package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Peisong  implements Serializable{
    private static final long serialVersionUID = 8889046827101707849L;
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private Long orders;

    private BigDecimal continuePrice;

    private Long continueWeight;

    private BigDecimal firstPrice;

    private Long firstWeight;

    private String icon;

    private String name;

    private BigDecimal defaultDeliveryCorp;

    private String description;

    private String hrmempIDS;

    public String getHrmempIDS() {
        return hrmempIDS;
    }

    public void setHrmempIDS(String hrmempIDS) {
        this.hrmempIDS = hrmempIDS;
    }

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

    public BigDecimal getContinuePrice() {
        return continuePrice;
    }

    public void setContinuePrice(BigDecimal continuePrice) {
        this.continuePrice = continuePrice;
    }

    public Long getContinueWeight() {
        return continueWeight;
    }

    public void setContinueWeight(Long continueWeight) {
        this.continueWeight = continueWeight;
    }

    public BigDecimal getFirstPrice() {
        return firstPrice;
    }

    public void setFirstPrice(BigDecimal firstPrice) {
        this.firstPrice = firstPrice;
    }

    public Long getFirstWeight() {
        return firstWeight;
    }

    public void setFirstWeight(Long firstWeight) {
        this.firstWeight = firstWeight;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public BigDecimal getDefaultDeliveryCorp() {
        return defaultDeliveryCorp;
    }

    public void setDefaultDeliveryCorp(BigDecimal defaultDeliveryCorp) {
        this.defaultDeliveryCorp = defaultDeliveryCorp;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}