package com.blog.service;

import com.blog.dao.BlogTypeMapper;
import com.blog.pojo.BlogType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2021-02-28 19:23
 */
@Service
public class BlogTypeService {
    @Autowired
    BlogTypeMapper mapper;

    public List<BlogType> getBlogTypes(){
        return mapper.getBlogTypes();
    }

    public BlogType getBlogTypeById(Integer id){
        return mapper.getBlogTypeById(id);
    }

    public boolean addBlogType(BlogType blogType){
        return mapper.addBlogType(blogType);
    }

    public boolean deleteBlogTypeById(Integer id){
        return mapper.deleteBlogTypeById(id);
    }

    public boolean updateBlogType(BlogType blogType){
        return mapper.updateBlogType(blogType);
    }

}
