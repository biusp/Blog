package com.blog.pojo;

/**博客类型表
 * @author shkstart
 * @create 2021-02-28 19:16
 */
public class BlogType {

    private Integer id;

    private String typeName;

    private Integer orderNo;//排序序号

    public BlogType() {
    }

    public BlogType(Integer id, String typeName, Integer orderNo) {
        this.id = id;
        this.typeName = typeName;
        this.orderNo = orderNo;
    }

    @Override
    public String toString() {
        return "BlogType{" +
                "id=" + id +
                ", typeName='" + typeName + '\'' +
                ", orderNo=" + orderNo +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }
}
