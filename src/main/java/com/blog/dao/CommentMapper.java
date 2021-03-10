package com.blog.dao;

import com.blog.pojo.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/** 评论的Mapper
 * @author shkstart
 * @create 2021-02-28 19:19
 */
@Repository
public interface CommentMapper {

    //获取所有评论
    List<Comment> getComments();

    //获取未过审的评论
    List<Comment> getCommentsNotReviewed();

    //通过id获取评论
    Comment getCommentById(Integer id);

    //获取评论相同博客的评论
    List<Comment> getCommentsByBlogId(Integer blogId);

    boolean addComment(Comment comment);

    boolean deleteCommentById(Integer id);

    boolean deleteCommentByBlogId(Integer blogId);

    boolean updateComment(Comment comment);
}
