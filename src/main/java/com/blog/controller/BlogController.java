package com.blog.controller;

import com.blog.pojo.Blog;
import com.blog.pojo.BlogType;
import com.blog.pojo.Comment;
import com.blog.pojo.Link;
import com.blog.service.BlogService;
import com.blog.service.BlogTypeService;
import com.blog.service.CommentService;
import com.blog.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**博客的controller
 * @author shkstart
 * @create 2021-03-02 14:55
 */
@Controller
public class BlogController {
    @Autowired
    LinkService linkService;

    @Autowired
    BlogService blogService;

    @Autowired
    BlogTypeService blogTypeService;

    @Autowired
    CommentService commentService;



    @RequestMapping("/getBlog")//获取博客内容
    public String getBlog(@RequestParam(value = "id",required = true) Integer id, Model model){
        Blog blog = blogService.getBlogById(id);
        List<Comment> comments = commentService.getCommentsByBlogId(id);
        model.addAttribute("blog",blog);
        model.addAttribute("comments",comments);
        return "foreground/blog";
    }

    @RequestMapping("/getHomePage")//获取主页上的所有数据,博客信息,博客类型等
    public String getHomePage(HttpSession session){
        //查询所有博客类型
        List<BlogType> blogTypes = blogTypeService.getBlogTypes();
        session.setAttribute("blogTypes",blogTypes);

        //查询所有博客信息
        List<Blog> blogs = blogService.getBlogs();
        session.setAttribute("blogs",blogs);

        //查询所有友情链接
        List<Link> links = linkService.getLinks();
        session.setAttribute("links",links);

        return "foreground/index";
    }


    @RequestMapping("/saveBlog")//保存博客
    public String saveBlog(Blog blog, Integer typeId,HttpSession session){
        //获取type_id设置blog的blogType属性
        BlogType blogType = new BlogType();
        blogType.setId(typeId);
        blog.setBlogType(blogType);
        //设置当前请求的时间为编写博客的时间
        blog.setReleaseDate(new Date());

        //调用service保存至数据库
        blogService.addBlog(blog);

        List<Blog> blogs = blogService.getBlogs();
        session.setAttribute("blogs",blogs);//更新数据
        return "admin/editormd";
    }


    @RequestMapping("/deleteBlog")//删除博客
    public String deleteBlog(Integer id,HttpSession session){
        List<Comment> commentsByBlogId = commentService.getCommentsByBlogId(id);
        if(commentsByBlogId.size() != 0){//如果该博客有评论
            commentService.deleteCommentByBlogId(id);//同时删除评论
        }
        blogService.deleteBlogById(id);
        List<Blog> blogs = blogService.getBlogs();
        session.setAttribute("blogs",blogs);//更新数据
        return "admin/blogManage";
    }


    @RequestMapping("/editBlog")//跳转修改博客页面
    public String editBlog(Integer id,Model model){
        Blog blogById = blogService.getBlogById(id);
        model.addAttribute("blog",blogById);
        return "admin/editBlog";
    }

    @RequestMapping("/updateBlog")//更新博客
    public String updateBlog(Blog blog,Integer typeId,HttpSession session){
        BlogType blogTypeById = new BlogType();
        blogTypeById.setId(typeId);
        blog.setBlogType(blogTypeById);
        blogService.updateBlog(blog);

        List<Blog> blogs = blogService.getBlogs();
        session.setAttribute("blogs",blogs);//更新数据

        return "admin/blogManage";
    }
    @RequestMapping("/file")//归档
    public String file(Model model){
        List<Blog> blogs = blogService.getBlogs();
        int end = blogs.get(0).getReleaseDate().getYear();//最新的年份
        int start = blogs.get(blogs.size() - 1).getReleaseDate().getYear();//最早的年份
        ArrayList<ArrayList<Blog>> arrayLists = new ArrayList<>();
        while (end >= start){
            ArrayList<Blog> blogArrayList = new ArrayList<Blog>();
            for (Blog blog : blogs) {
                if(blog.getReleaseDate().getYear()<end){
                    break;
                }
                if(blog.getReleaseDate().getYear()==end){
                    blogArrayList.add(blog);
                }
            }
            if(blogArrayList.size() != 0){

                arrayLists.add(blogArrayList);
            }
            end--;
        }
        model.addAttribute("arrayLists",arrayLists);
        return "foreground/file";
    }





}
