package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Area implements Serializable {
    private static final long serialVersionUID = -5274303965152076483L;
    private BigDecimal areaid;

    private String createDate;

    private String modifyDate;

    private Long orders;

    private String fullName;

    private String areaname;

    private String treePath;

    private BigDecimal areaparent;

    public BigDecimal getAreaid() {
        return areaid;
    }

    public void setAreaid(BigDecimal areaid) {
        this.areaid = areaid;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate == null ? null : createDate.trim();
    }

    public String getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate == null ? null : modifyDate.trim();
    }

    public Long getOrders() {
        return orders;
    }

    public void setOrders(Long orders) {
        this.orders = orders;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName == null ? null : fullName.trim();
    }

    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname == null ? null : areaname.trim();
    }

    public String getTreePath() {
        return treePath;
    }

    public void setTreePath(String treePath) {
        this.treePath = treePath == null ? null : treePath.trim();
    }

    public BigDecimal getAreaparent() {
        return areaparent;
    }

    public void setAreaparent(BigDecimal areaparent) {
        this.areaparent = areaparent;
    }
}