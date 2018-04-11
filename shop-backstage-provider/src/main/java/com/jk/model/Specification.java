package com.jk.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/4/10.
 */
public class Specification implements Serializable{

    private static final long serialVersionUID = 6318739061002302375L;
    
    private String id;
    private Date createdate;//创建时间
    private Date modifydate;//修改时间
    private Integer orders;//排序
    private String memo;//备注
    private String name;//名字
    private Integer type;//类型
    List<SpecificationValue> specificationValues;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getModifydate() {
        return modifydate;
    }

    public void setModifydate(Date modifydate) {
        this.modifydate = modifydate;
    }

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public List<SpecificationValue> getSpecificationValues() {
        return specificationValues;
    }

    public void setSpecificationValues(List<SpecificationValue> specificationValues) {
        this.specificationValues = specificationValues;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Specification that = (Specification) o;

        return id.equals(that.id);

    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }

    @Override
    public String toString() {
        return "Specification{" +
                "id='" + id + '\'' +
                ", createdate=" + createdate +
                ", modifydate=" + modifydate +
                ", orders=" + orders +
                ", memo='" + memo + '\'' +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", specificationValues=" + specificationValues +
                '}';
    }
}
