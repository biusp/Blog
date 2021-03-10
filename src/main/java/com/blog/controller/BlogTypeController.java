package com.blog.controller;

import com.blog.pojo.Blog;
import com.blog.pojo.BlogType;
import com.blog.service.BlogService;
import com.blog.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import java.util.List;

/**博客类型的controller
 * @author shkstart
 * @create 2021-02-28 19:28
 */
@Controller
public class BlogTypeController {
    @Autowired
    BlogTypeService service;

    @Autowired
    BlogService blogService;


    @RequestMapping("/getBlogTypes")//获取所有的博客类型
    public String getBlogTypes(Model model, HttpSession session){
        List<BlogType> blogTypes = service.getBlogTypes();
        session.setAttribute("blogTypes",blogTypes);
        return "foreground/index";
    }

    @RequestMapping("/addBlogType")
    public String addBlogType(BlogType blogType, HttpSession session){
        service.addBlogType(blogType);
        List<BlogType> blogTypes = service.getBlogTypes();
        session.setAttribute("blogTypes",blogTypes);//更新数据
        return "admin/blogTypeManage";

    }

    @RequestMapping("/deleteBlogType")
    public String deleteBlogType(Integer id, HttpSession session,Model model){
        List<Blog> blogs = blogService.getBlogs();
        for (Blog blog : blogs) {
            if(blog.getBlogType().getId() == id){//如果有博客使用了该博客类型,则不能删除
                model.addAttribute("inUse","true");//把是否使用中写入request域中
                return "admin/blogTypeManage";
            }
        }

        //没有使用的话就删除
        service.deleteBlogTypeById(id);
        List<BlogType> blogTypes = service.getBlogTypes();
        session.setAttribute("blogTypes",blogTypes);//更新数据
        return "admin/blogTypeManage";
    }

    @RequestMapping("/editBlogType")
    public String editBlogType(Integer id,Model model){
        BlogType blogType = service.getBlogTypeById(id);
        model.addAttribute("type",blogType);
        return "admin/editBlogType";
    }

    @RequestMapping("/updateBlogType")
    public String updateBlogType(BlogType type, HttpSession session){

        service.updateBlogType(type);
        List<BlogType> blogTypes = service.getBlogTypes();
        session.setAttribute("blogTypes",blogTypes);//更新数据
        return "admin/blogTypeManage";
    }

    @ResponseBody
    @RequestMapping("/ajaxIdExist")
    public String ajaxIdExist(Integer id){
        BlogType blogTypeById = service.getBlogTypeById(id);

        return blogTypeById==null?"false":"true";

    }

}
