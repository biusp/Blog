package com.blog.controller;

import com.blog.pojo.Blog;
import com.blog.pojo.BlogType;
import com.blog.pojo.Comment;
import com.blog.service.BlogService;
import com.blog.service.BlogTypeService;
import com.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**评论的controller
 * @author shkstart
 * @create 2021-02-28 19:28
 */
@Controller
public class CommentController {
    @Autowired
    CommentService service;



    @RequestMapping("/getComments")//获取所有的评论
    public String getBlogTypes(Model model){
        List<Comment> comments = service.getComments();
        model.addAttribute("comments",comments);
        return "admin/commentManage";
    }
    @RequestMapping("/getMessage")//获取所有网站的评论
    public String getMessage(Model model){
        List<Comment> comments = service.getCommentsByBlogId(1);//1表示网站评论
        model.addAttribute("comments",comments);
        return "foreground/message";
    }

    @RequestMapping("/getCommentModeration")//获取审核的评论
    public String getCommentModeration(Model model){
        List<Comment> notReviewedcomments = service.getCommentsNotReviewed();
        model.addAttribute("notReviewedcomments",notReviewedcomments);
        return "admin/commentModeration";
    }

    @RequestMapping("/commentModeration")//审核评论
    public String commentModeration(Model model,@RequestParam(value = "state",required = true) Integer state,@RequestParam(value = "id",required = true) Integer id){
        Comment comment = new Comment();
        comment.setState(state);
        comment.setId(id);
        service.updateComment(comment);
        return "forward:/getCommentModeration";
    }

    @RequestMapping("/deleteComment")
    public String deleteComment(Model model, @RequestParam(value = "id",required = true) Integer id){
        service.deleteCommentById(id);
        return "forward:/getComments";
    }


    @ResponseBody
    @RequestMapping("/addCommentAjax")
    public String addComment(Comment comment, Integer blogId){
        Blog blog = new Blog();
        blog.setId(blogId);
        comment.setState(0);
        comment.setBlog(blog);
        comment.setCommentDate(new Date());
        service.addComment(comment);
        return "SUCCESS";
    }



}
