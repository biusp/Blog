package com.blog.service;

import com.blog.dao.BlogMapper;
import com.blog.pojo.Blog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2021-03-02 15:33
 */
@Service
public class BlogService {
    @Autowired
    private BlogMapper mapper;

    //获取所有博客,不包含content
    public List<Blog> getBlogs() {
        return mapper.getBlogs();
    }

    public Blog getBlogById(Integer id) {
        return mapper.getBlogById(id);
    }

    public boolean updateBlog(Blog blog) {
        return mapper.updateBlog(blog);
    }

    public boolean deleteBlogById(Integer id) {
        return mapper.deleteBlogById(id);
    }

    public boolean addBlog(Blog blog) {
        return mapper.addBlog(blog);
    }
}
