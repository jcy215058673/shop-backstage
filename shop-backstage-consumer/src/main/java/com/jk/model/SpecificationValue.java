package com.jk.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2018/4/10.
 */
public class SpecificationValue implements Serializable{
    private static final long serialVersionUID = 4961507569299522692L;
    private String id;
    private Date creatadate;//创建时间
    private Date modifydate;//修改时间
    private Integer svorders;//排序
    private String image;//图片
    private String svname;//名字
    private String specification;//规格

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreatadate() {
        return creatadate;
    }

    public void setCreatadate(Date creatadate) {
        this.creatadate = creatadate;
    }

    public Date getModifydate() {
        return modifydate;
    }

    public void setModifydate(Date modifydate) {
        this.modifydate = modifydate;
    }

    public Integer getSvorders() {
        return svorders;
    }

    public void setSvorders(Integer svorders) {
        this.svorders = svorders;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getSvname() {
        return svname;
    }

    public void setSvname(String svname) {
        this.svname = svname;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SpecificationValue that = (SpecificationValue) o;

        return id.equals(that.id);

    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }

    @Override
    public String toString() {
        return "SpecificationValue{" +
                "id='" + id + '\'' +
                ", creatadate=" + creatadate +
                ", modifydate=" + modifydate +
                ", svorders=" + svorders +
                ", image='" + image + '\'' +
                ", svname='" + svname + '\'' +
                ", specification='" + specification + '\'' +
                '}';
    }
}
