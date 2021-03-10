package com.blog.dao;

import com.blog.pojo.Blog;
import com.blog.pojo.Blogger;
import org.springframework.stereotype.Repository;

import java.util.List;

/**博客类的mapper
 * @author shkstart
 * @create 2021-02-28 20:04
 */
@Repository
public interface BlogMapper {

    //获取所有博客,不包含content
    List<Blog> getBlogs();

    Blog getBlogById(Integer id);

    boolean updateBlog(Blog blog);

    boolean deleteBlogById(Integer id);

    boolean addBlog(Blog blog);

}
