package com.blog.service;

import com.blog.dao.BloggerMapper;
import com.blog.dao.CommentMapper;
import com.blog.pojo.Blogger;
import com.blog.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2021-02-28 20:16
 */
@Service
public class CommentService {
    @Autowired
    CommentMapper mapper;


    //获取所有评论
    public List<Comment> getComments(){
        return mapper.getComments();
    }

    //获取未过审的评论
    public List<Comment> getCommentsNotReviewed(){
        return mapper.getCommentsNotReviewed();
    }

    //通过id获取评论
    public Comment getCommentById(Integer id) {
        return mapper.getCommentById(id);

    }

    //获取评论相同博客的评论
    public List<Comment> getCommentsByBlogId(Integer blogId) {
        return mapper.getCommentsByBlogId(blogId);
    }

    public boolean addComment(Comment comment) {
        return mapper.addComment(comment);
    }

    public boolean deleteCommentById(Integer id) {
        return mapper.deleteCommentById(id);
    }

    public boolean deleteCommentByBlogId(Integer blogId){
        return mapper.deleteCommentByBlogId(blogId);
    }

    public boolean updateComment(Comment comment) {
        return mapper.updateComment(comment);
    }
}
