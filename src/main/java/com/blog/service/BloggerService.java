package com.blog.service;

import com.blog.dao.BloggerMapper;
import com.blog.pojo.BlogType;
import com.blog.pojo.Blogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author shkstart
 * @create 2021-02-28 20:16
 */
@Service
public class BloggerService {
    @Autowired
    BloggerMapper mapper;


    /**
     * 查询是否存在该博主
     * @return boolean
     */
//    public boolean ExistenceBlogger(Blogger blogger){
//        Blogger blogTypeByUsername = getBlogBloggerUsername(blogger.getUserName());
//        if (blogTypeByUsername == null || blogTypeByUsername.getPassword() != blogger.getPassword()){
//            return false;
//        }else {
//            return true;
//        }
//    }


    public Blogger getBloggerByUsername(String username){
        return mapper.getBloggerByUsername(username);
    }

    public boolean addBlogger(Blogger blogger){
        return mapper.addBlogger(blogger);
    }

    public boolean deleteBloggerByUsername(String username){
        return mapper.deleteBloggerByUsername(username);
    }

    public boolean updateBlogger(Blogger blogger){
        return mapper.updateBlogger(blogger);
    }
}
