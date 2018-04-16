package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Order implements Serializable{

    private static final long serialVersionUID = 1330298035903159116L;
    private BigDecimal id;

    private String createdate;

    private String modifyDate;

    private String address;

    private BigDecimal amountPaid;

    private String areaName;

    private String consignee;

    private BigDecimal couponDiscount;

    private String expire;

    private String invoiceTitle;

    private String lockExpire;

    private String memo;

    private BigDecimal offsetAmount;

    private Long orderStatus;

    private String paymentmethodname;

    private Long paymentStatus;

    private String phone;

    private BigDecimal point;

    private String promotion;

    private String shippingmethodname;

    private Long shippingStatus;

    private String sn;

    private BigDecimal tax;

    private String zipCode;

    private BigDecimal area;

    private BigDecimal couponCode;

    private BigDecimal member;

    private BigDecimal operator;

    private BigDecimal paymentMethod;

    private BigDecimal shippingMethod;


    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BigDecimal getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public BigDecimal getCouponDiscount() {
        return couponDiscount;
    }

    public void setCouponDiscount(BigDecimal couponDiscount) {
        this.couponDiscount = couponDiscount;
    }

    public String getExpire() {
        return expire;
    }

    public void setExpire(String expire) {
        this.expire = expire;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle;
    }

    public String getLockExpire() {
        return lockExpire;
    }

    public void setLockExpire(String lockExpire) {
        this.lockExpire = lockExpire;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public BigDecimal getOffsetAmount() {
        return offsetAmount;
    }

    public void setOffsetAmount(BigDecimal offsetAmount) {
        this.offsetAmount = offsetAmount;
    }

    public Long getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Long orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPaymentmethodname() {
        return paymentmethodname;
    }

    public void setPaymentmethodname(String paymentmethodname) {
        this.paymentmethodname = paymentmethodname;
    }

    public Long getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(Long paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public BigDecimal getPoint() {
        return point;
    }

    public void setPoint(BigDecimal point) {
        this.point = point;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public String getShippingmethodname() {
        return shippingmethodname;
    }

    public void setShippingmethodname(String shippingmethodname) {
        this.shippingmethodname = shippingmethodname;
    }

    public Long getShippingStatus() {
        return shippingStatus;
    }

    public void setShippingStatus(Long shippingStatus) {
        this.shippingStatus = shippingStatus;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public BigDecimal getTax() {
        return tax;
    }

    public void setTax(BigDecimal tax) {
        this.tax = tax;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public BigDecimal getArea() {
        return area;
    }

    public void setArea(BigDecimal area) {
        this.area = area;
    }

    public BigDecimal getCouponCode() {
        return couponCode;
    }

    public void setCouponCode(BigDecimal couponCode) {
        this.couponCode = couponCode;
    }

    public BigDecimal getMember() {
        return member;
    }

    public void setMember(BigDecimal member) {
        this.member = member;
    }

    public BigDecimal getOperator() {
        return operator;
    }

    public void setOperator(BigDecimal operator) {
        this.operator = operator;
    }

    public BigDecimal getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(BigDecimal paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public BigDecimal getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(BigDecimal shippingMethod) {
        this.shippingMethod = shippingMethod;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        if (id != null ? !id.equals(order.id) : order.id != null) return false;
        if (createdate != null ? !createdate.equals(order.createdate) : order.createdate != null) return false;
        if (modifyDate != null ? !modifyDate.equals(order.modifyDate) : order.modifyDate != null) return false;
        if (address != null ? !address.equals(order.address) : order.address != null) return false;
        if (amountPaid != null ? !amountPaid.equals(order.amountPaid) : order.amountPaid != null) return false;
        if (areaName != null ? !areaName.equals(order.areaName) : order.areaName != null) return false;
        if (consignee != null ? !consignee.equals(order.consignee) : order.consignee != null) return false;
        if (couponDiscount != null ? !couponDiscount.equals(order.couponDiscount) : order.couponDiscount != null)
            return false;
        if (expire != null ? !expire.equals(order.expire) : order.expire != null) return false;
        if (invoiceTitle != null ? !invoiceTitle.equals(order.invoiceTitle) : order.invoiceTitle != null) return false;
        if (lockExpire != null ? !lockExpire.equals(order.lockExpire) : order.lockExpire != null) return false;
        if (memo != null ? !memo.equals(order.memo) : order.memo != null) return false;
        if (offsetAmount != null ? !offsetAmount.equals(order.offsetAmount) : order.offsetAmount != null) return false;
        if (orderStatus != null ? !orderStatus.equals(order.orderStatus) : order.orderStatus != null) return false;
        if (paymentmethodname != null ? !paymentmethodname.equals(order.paymentmethodname) : order.paymentmethodname != null)
            return false;
        if (paymentStatus != null ? !paymentStatus.equals(order.paymentStatus) : order.paymentStatus != null)
            return false;
        if (phone != null ? !phone.equals(order.phone) : order.phone != null) return false;
        if (point != null ? !point.equals(order.point) : order.point != null) return false;
        if (promotion != null ? !promotion.equals(order.promotion) : order.promotion != null) return false;
        if (shippingmethodname != null ? !shippingmethodname.equals(order.shippingmethodname) : order.shippingmethodname != null)
            return false;
        if (shippingStatus != null ? !shippingStatus.equals(order.shippingStatus) : order.shippingStatus != null)
            return false;
        if (sn != null ? !sn.equals(order.sn) : order.sn != null) return false;
        if (tax != null ? !tax.equals(order.tax) : order.tax != null) return false;
        if (zipCode != null ? !zipCode.equals(order.zipCode) : order.zipCode != null) return false;
        if (area != null ? !area.equals(order.area) : order.area != null) return false;
        if (couponCode != null ? !couponCode.equals(order.couponCode) : order.couponCode != null) return false;
        if (member != null ? !member.equals(order.member) : order.member != null) return false;
        if (operator != null ? !operator.equals(order.operator) : order.operator != null) return false;
        if (paymentMethod != null ? !paymentMethod.equals(order.paymentMethod) : order.paymentMethod != null)
            return false;
        return shippingMethod != null ? shippingMethod.equals(order.shippingMethod) : order.shippingMethod == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (createdate != null ? createdate.hashCode() : 0);
        result = 31 * result + (modifyDate != null ? modifyDate.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (amountPaid != null ? amountPaid.hashCode() : 0);
        result = 31 * result + (areaName != null ? areaName.hashCode() : 0);
        result = 31 * result + (consignee != null ? consignee.hashCode() : 0);
        result = 31 * result + (couponDiscount != null ? couponDiscount.hashCode() : 0);
        result = 31 * result + (expire != null ? expire.hashCode() : 0);
        result = 31 * result + (invoiceTitle != null ? invoiceTitle.hashCode() : 0);
        result = 31 * result + (lockExpire != null ? lockExpire.hashCode() : 0);
        result = 31 * result + (memo != null ? memo.hashCode() : 0);
        result = 31 * result + (offsetAmount != null ? offsetAmount.hashCode() : 0);
        result = 31 * result + (orderStatus != null ? orderStatus.hashCode() : 0);
        result = 31 * result + (paymentmethodname != null ? paymentmethodname.hashCode() : 0);
        result = 31 * result + (paymentStatus != null ? paymentStatus.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (point != null ? point.hashCode() : 0);
        result = 31 * result + (promotion != null ? promotion.hashCode() : 0);
        result = 31 * result + (shippingmethodname != null ? shippingmethodname.hashCode() : 0);
        result = 31 * result + (shippingStatus != null ? shippingStatus.hashCode() : 0);
        result = 31 * result + (sn != null ? sn.hashCode() : 0);
        result = 31 * result + (tax != null ? tax.hashCode() : 0);
        result = 31 * result + (zipCode != null ? zipCode.hashCode() : 0);
        result = 31 * result + (area != null ? area.hashCode() : 0);
        result = 31 * result + (couponCode != null ? couponCode.hashCode() : 0);
        result = 31 * result + (member != null ? member.hashCode() : 0);
        result = 31 * result + (operator != null ? operator.hashCode() : 0);
        result = 31 * result + (paymentMethod != null ? paymentMethod.hashCode() : 0);
        result = 31 * result + (shippingMethod != null ? shippingMethod.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", createdate='" + createdate + '\'' +
                ", modifyDate='" + modifyDate + '\'' +
                ", address='" + address + '\'' +
                ", amountPaid=" + amountPaid +
                ", areaName='" + areaName + '\'' +
                ", consignee='" + consignee + '\'' +
                ", couponDiscount=" + couponDiscount +
                ", expire='" + expire + '\'' +
                ", invoiceTitle='" + invoiceTitle + '\'' +
                ", lockExpire='" + lockExpire + '\'' +
                ", memo='" + memo + '\'' +
                ", offsetAmount=" + offsetAmount +
                ", orderStatus=" + orderStatus +
                ", paymentmethodname='" + paymentmethodname + '\'' +
                ", paymentStatus=" + paymentStatus +
                ", phone='" + phone + '\'' +
                ", point=" + point +
                ", promotion='" + promotion + '\'' +
                ", shippingmethodname='" + shippingmethodname + '\'' +
                ", shippingStatus=" + shippingStatus +
                ", sn='" + sn + '\'' +
                ", tax=" + tax +
                ", zipCode='" + zipCode + '\'' +
                ", area=" + area +
                ", couponCode=" + couponCode +
                ", member=" + member +
                ", operator=" + operator +
                ", paymentMethod=" + paymentMethod +
                ", shippingMethod=" + shippingMethod +
                '}';
    }
}