package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Shipping implements Serializable{
    private static final long serialVersionUID = 7941929840683545481L;
    private BigDecimal id;

    private String createDate;

    private String modifyDate;

    private String address;

    private String area;

    private String consignee;

    private String deliveryCorp;

    private String deliveryCorpCode;

    private String deliveryCorpUrl;

    private BigDecimal freight;

    private String memo;

    private String operator;

    private String phone;

    private String shippingMethod;

    private String sn;

    private String trackingNo;

    private String zipCode;

    private BigDecimal orders;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
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

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getDeliveryCorp() {
        return deliveryCorp;
    }

    public void setDeliveryCorp(String deliveryCorp) {
        this.deliveryCorp = deliveryCorp;
    }

    public String getDeliveryCorpCode() {
        return deliveryCorpCode;
    }

    public void setDeliveryCorpCode(String deliveryCorpCode) {
        this.deliveryCorpCode = deliveryCorpCode;
    }

    public String getDeliveryCorpUrl() {
        return deliveryCorpUrl;
    }

    public void setDeliveryCorpUrl(String deliveryCorpUrl) {
        this.deliveryCorpUrl = deliveryCorpUrl;
    }

    public BigDecimal getFreight() {
        return freight;
    }

    public void setFreight(BigDecimal freight) {
        this.freight = freight;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(String shippingMethod) {
        this.shippingMethod = shippingMethod;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getTrackingNo() {
        return trackingNo;
    }

    public void setTrackingNo(String trackingNo) {
        this.trackingNo = trackingNo;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public BigDecimal getOrders() {
        return orders;
    }

    public void setOrders(BigDecimal orders) {
        this.orders = orders;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Shipping shipping = (Shipping) o;

        if (id != null ? !id.equals(shipping.id) : shipping.id != null) return false;
        if (createDate != null ? !createDate.equals(shipping.createDate) : shipping.createDate != null) return false;
        if (modifyDate != null ? !modifyDate.equals(shipping.modifyDate) : shipping.modifyDate != null) return false;
        if (address != null ? !address.equals(shipping.address) : shipping.address != null) return false;
        if (area != null ? !area.equals(shipping.area) : shipping.area != null) return false;
        if (consignee != null ? !consignee.equals(shipping.consignee) : shipping.consignee != null) return false;
        if (deliveryCorp != null ? !deliveryCorp.equals(shipping.deliveryCorp) : shipping.deliveryCorp != null)
            return false;
        if (deliveryCorpCode != null ? !deliveryCorpCode.equals(shipping.deliveryCorpCode) : shipping.deliveryCorpCode != null)
            return false;
        if (deliveryCorpUrl != null ? !deliveryCorpUrl.equals(shipping.deliveryCorpUrl) : shipping.deliveryCorpUrl != null)
            return false;
        if (freight != null ? !freight.equals(shipping.freight) : shipping.freight != null) return false;
        if (memo != null ? !memo.equals(shipping.memo) : shipping.memo != null) return false;
        if (operator != null ? !operator.equals(shipping.operator) : shipping.operator != null) return false;
        if (phone != null ? !phone.equals(shipping.phone) : shipping.phone != null) return false;
        if (shippingMethod != null ? !shippingMethod.equals(shipping.shippingMethod) : shipping.shippingMethod != null)
            return false;
        if (sn != null ? !sn.equals(shipping.sn) : shipping.sn != null) return false;
        if (trackingNo != null ? !trackingNo.equals(shipping.trackingNo) : shipping.trackingNo != null) return false;
        if (zipCode != null ? !zipCode.equals(shipping.zipCode) : shipping.zipCode != null) return false;
        return orders != null ? orders.equals(shipping.orders) : shipping.orders == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (modifyDate != null ? modifyDate.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (area != null ? area.hashCode() : 0);
        result = 31 * result + (consignee != null ? consignee.hashCode() : 0);
        result = 31 * result + (deliveryCorp != null ? deliveryCorp.hashCode() : 0);
        result = 31 * result + (deliveryCorpCode != null ? deliveryCorpCode.hashCode() : 0);
        result = 31 * result + (deliveryCorpUrl != null ? deliveryCorpUrl.hashCode() : 0);
        result = 31 * result + (freight != null ? freight.hashCode() : 0);
        result = 31 * result + (memo != null ? memo.hashCode() : 0);
        result = 31 * result + (operator != null ? operator.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (shippingMethod != null ? shippingMethod.hashCode() : 0);
        result = 31 * result + (sn != null ? sn.hashCode() : 0);
        result = 31 * result + (trackingNo != null ? trackingNo.hashCode() : 0);
        result = 31 * result + (zipCode != null ? zipCode.hashCode() : 0);
        result = 31 * result + (orders != null ? orders.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Shipping{" +
                "id=" + id +
                ", createDate='" + createDate + '\'' +
                ", modifyDate='" + modifyDate + '\'' +
                ", address='" + address + '\'' +
                ", area='" + area + '\'' +
                ", consignee='" + consignee + '\'' +
                ", deliveryCorp='" + deliveryCorp + '\'' +
                ", deliveryCorpCode='" + deliveryCorpCode + '\'' +
                ", deliveryCorpUrl='" + deliveryCorpUrl + '\'' +
                ", freight=" + freight +
                ", memo='" + memo + '\'' +
                ", operator='" + operator + '\'' +
                ", phone='" + phone + '\'' +
                ", shippingMethod='" + shippingMethod + '\'' +
                ", sn='" + sn + '\'' +
                ", trackingNo='" + trackingNo + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", orders=" + orders +
                '}';
    }
}