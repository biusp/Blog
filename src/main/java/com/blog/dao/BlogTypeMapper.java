package com.blog.dao;

import com.blog.pojo.BlogType;
import org.springframework.stereotype.Repository;

import java.util.List;

/** 博客类型的Mapper
 * @author shkstart
 * @create 2021-02-28 19:19
 */
@Repository
public interface BlogTypeMapper {
    List<BlogType> getBlogTypes();

    BlogType getBlogTypeById(Integer id);

    boolean addBlogType(BlogType blogType);

    boolean deleteBlogTypeById(Integer id);

    boolean updateBlogType(BlogType blogType);
}
