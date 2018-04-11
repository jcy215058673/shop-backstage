package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Zhifu implements Serializable {
    private static final long serialVersionUID = -7764701285060307587L;
    private BigDecimal zid;

    private Date zcreateDate;

    private Date zmodifyDate;

    private Long zorders;

    private String zdescription;

    private String zicon;

    private Long zmethod;

    private String zname;

    private Long ztimeout;

    private String zcontent;

    private String hrmempIDS;

    private Integer peiid;

    private String peiname;

    public BigDecimal getZid() {
        return zid;
    }

    public void setZid(BigDecimal zid) {
        this.zid = zid;
    }

    public Date getZcreateDate() {
        return zcreateDate;
    }

    public void setZcreateDate(Date zcreateDate) {
        this.zcreateDate = zcreateDate;
    }

    public Date getZmodifyDate() {
        return zmodifyDate;
    }

    public void setZmodifyDate(Date zmodifyDate) {
        this.zmodifyDate = zmodifyDate;
    }

    public Long getZorders() {
        return zorders;
    }

    public void setZorders(Long zorders) {
        this.zorders = zorders;
    }

    public String getZdescription() {
        return zdescription;
    }

    public void setZdescription(String zdescription) {
        this.zdescription = zdescription;
    }

    public String getZicon() {
        return zicon;
    }

    public void setZicon(String zicon) {
        this.zicon = zicon;
    }

    public Long getZmethod() {
        return zmethod;
    }

    public void setZmethod(Long zmethod) {
        this.zmethod = zmethod;
    }

    public String getZname() {
        return zname;
    }

    public void setZname(String zname) {
        this.zname = zname;
    }

    public Long getZtimeout() {
        return ztimeout;
    }

    public void setZtimeout(Long ztimeout) {
        this.ztimeout = ztimeout;
    }

    public String getZcontent() {
        return zcontent;
    }

    public void setZcontent(String zcontent) {
        this.zcontent = zcontent;
    }

    public String getHrmempIDS() {
        return hrmempIDS;
    }

    public void setHrmempIDS(String hrmempIDS) {
        this.hrmempIDS = hrmempIDS;
    }

    public Integer getPeiid() {
        return peiid;
    }

    public void setPeiid(Integer peiid) {
        this.peiid = peiid;
    }

    public String getPeiname() {
        return peiname;
    }

    public void setPeiname(String peiname) {
        this.peiname = peiname;
    }
}