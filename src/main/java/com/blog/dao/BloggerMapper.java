package com.blog.dao;

import com.blog.pojo.BlogType;
import com.blog.pojo.Blogger;
import org.springframework.stereotype.Repository;

import java.util.List;

/**博主类的mapper
 * @author shkstart
 * @create 2021-02-28 20:04
 */
@Repository
public interface BloggerMapper {

    //通过用户名获取博主
    Blogger getBloggerByUsername(String username);

    boolean addBlogger(Blogger blogger);

    boolean deleteBloggerByUsername(String username);

    boolean updateBlogger(Blogger blogger);
}
