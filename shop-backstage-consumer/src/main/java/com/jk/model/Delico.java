package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Delico implements Serializable {
    private static final long serialVersionUID = -6182378962945849243L;
    private BigDecimal wid;

    private Date wcreateDate;

    private Date wmodifyDate;

    private Long worders;

    private String wcode;

    private String wname;

    private String wurl;

    private String hrmempIDS;

    public String getHrmempIDS() {
        return hrmempIDS;
    }

    public void setHrmempIDS(String hrmempIDS) {
        this.hrmempIDS = hrmempIDS;
    }

    public BigDecimal getWid() {
        return wid;
    }

    public void setWid(BigDecimal wid) {
        this.wid = wid;
    }

    public Date getWcreateDate() {
        return wcreateDate;
    }

    public void setWcreateDate(Date wcreateDate) {
        this.wcreateDate = wcreateDate;
    }

    public Date getWmodifyDate() {
        return wmodifyDate;
    }

    public void setWmodifyDate(Date wmodifyDate) {
        this.wmodifyDate = wmodifyDate;
    }

    public Long getWorders() {
        return worders;
    }

    public void setWorders(Long worders) {
        this.worders = worders;
    }

    public String getWcode() {
        return wcode;
    }

    public void setWcode(String wcode) {
        this.wcode = wcode == null ? null : wcode.trim();
    }

    public String getWname() {
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname == null ? null : wname.trim();
    }

    public String getWurl() {
        return wurl;
    }

    public void setWurl(String wurl) {
        this.wurl = wurl == null ? null : wurl.trim();
    }
}