package com.blog.pojo;


import javax.xml.crypto.Data;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**博客表
 * @author shkstart
 * @create 2021-03-02 14:46
 */
public class Blog {

    private Integer id;

    private String title;

    private String summary;//摘要

    private Date releaseDate;//提交时间

    private int clickHit;//点击数

    private int replyHit;//回复数

    private String content;//博客内容

    private String keyword;//查询的关键字

    private BlogType blogType;//博客类型

    public Blog() {
    }

    public Blog(Integer id, String title, String summary, Date releaseDate, int clickHit, int replyHit, String content, String keyword, BlogType blogType) {
        this.id = id;
        this.title = title;
        this.summary = summary;
        this.releaseDate = releaseDate;
        this.clickHit = clickHit;
        this.replyHit = replyHit;
        this.content = content;
        this.keyword = keyword;
        this.blogType = blogType;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", releaseDate=" + releaseDate +
                ", clickHit=" + clickHit +
                ", replyHit=" + replyHit +
                ", content='" + content + '\'' +
                ", keyword='" + keyword + '\'' +
                ", blogType=" + blogType +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getReleaseDateByFormat() {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date = format.format(releaseDate).toString();
        String[] split = date.split("-");
        date = split[0] + "年" + split[1] + "月" + split[2] + "日";

        return date;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getClickHit() {
        return clickHit;
    }

    public void setClickHit(int clickHit) {
        this.clickHit = clickHit;
    }

    public int getReplyHit() {
        return replyHit;
    }

    public void setReplyHit(int replyHit) {
        this.replyHit = replyHit;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public BlogType getBlogType() {
        return blogType;
    }

    public void setBlogType(BlogType blogType) {
        this.blogType = blogType;
    }
}
