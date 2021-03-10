package com.blog.pojo;

/** 友情链接类
 * @author shkstart
 * @create 2021-03-05 17:15
 */
public class Link {
    private Integer id;
    private String linkName;
    private String linkUrl;
    private Integer orderNo;

    @Override
    public String toString() {
        return "Link{" +
                "id=" + id +
                ", linkName='" + linkName + '\'' +
                ", linkUrl='" + linkUrl + '\'' +
                ", orderNo=" + orderNo +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Link() {
    }

    public Link(Integer id, String linkName, String linkUrl, Integer orderNo) {
        this.id = id;
        this.linkName = linkName;
        this.linkUrl = linkUrl;
        this.orderNo = orderNo;
    }
}
