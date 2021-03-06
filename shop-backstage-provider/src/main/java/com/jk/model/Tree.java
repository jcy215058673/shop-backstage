package com.jk.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2018/4/8.
 */
public class Tree implements Serializable{

    private static final long serialVersionUID = -9184975705730554506L;

    private Integer id;
    private String text;
    private Integer pid;
    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tree tree = (Tree) o;

        return id.equals(tree.id);

    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }

    @Override
    public String toString() {
        return "Tree{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", pid=" + pid +
                ", url='" + url + '\'' +
                '}';
    }
}
