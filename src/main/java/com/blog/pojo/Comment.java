package com.blog.pojo;

import java.util.Date;

/**
 * @author shkstart
 * @create 2021-03-05 14:28
 */
public class Comment {
    private Integer id ;
    private String userIp;//评论者的ip地址
    private Blog blog;//被评论的博客

    private String content;//内容
    private Date commentDate;//评论时间
    private Integer state;//评论状态  0:未审核 1:通过 2:未通过

    public String getUserIp() {
        return userIp;
    }

    public void setUserIp(String userIp) {
        this.userIp = userIp;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", blog=" + blog +
                ", content='" + content + '\'' +
                ", commentDate='" + commentDate + '\'' +
                ", state=" + state +
                '}';
    }

    public Comment() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
