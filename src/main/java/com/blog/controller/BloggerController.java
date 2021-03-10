package com.blog.controller;

import com.blog.pojo.Blog;
import com.blog.pojo.BlogType;
import com.blog.pojo.Blogger;
import com.blog.service.BlogService;
import com.blog.service.BloggerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**博客主的controller
 * @author shkstart
 * @create 2021-02-28 19:18
 */
@Controller
public class BloggerController {
    @Autowired
    BloggerService bloggerService;



    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session, Model model){

        if (username == null || password == null || password.equals("") || username.equals("")){//如果登入名或密码为空
            model.addAttribute("error","用户名或密码错误!");//错误信息
            model.addAttribute("username","username");//表单回显
            return "admin/login";
        }

        Blogger blogger = bloggerService.getBloggerByUsername(username);


        if (blogger == null ){
            model.addAttribute("error","用户名或密码错误!");//错误信息
            model.addAttribute("username","username");//表单回显

            return "admin/login";//用户名或密码错误
        }else if(!password.equals(blogger.getPassword())){//密码是否错误
            model.addAttribute("error","用户名或密码错误!");//错误信息
            model.addAttribute("username","username");//表单回显

            return "admin/login";//用户名或密码错误
        } else {
            //登入成功,把blogger的信息存放在session中
            session.setAttribute("blogger",blogger);

            return "admin/index";
        }


    }
    @RequestMapping("/logOut")
    public String logOut(HttpSession session){
        session.setAttribute("blogger",null);
        return "index";
    }

    @RequestMapping("/about")//查询关于页面的博主信息
    public String about(Model model){
        Blogger admin = bloggerService.getBloggerByUsername("admin");
        model.addAttribute("admin",admin);
        return "foreground/about";
    }

    @ResponseBody
    @RequestMapping("/changePassword")
    public String changePassword(String userName,String oldPassword,String newPassword){
        Blogger blogger = bloggerService.getBloggerByUsername(userName);
        if(blogger == null || !blogger.getPassword().equals(oldPassword)){
            return "用户名或密码错误!";
        }else {
            blogger.setPassword(newPassword);
            bloggerService.updateBlogger(blogger);
            return "SUCCESS";
        }
    }
    @ResponseBody
    @RequestMapping("/ajaxUserNameExist")
    public String ajaxUserNameExist(String userName){
        Blogger blogger = bloggerService.getBloggerByUsername(userName);
        if(blogger != null){
            return "false";
        }else {
            return "true";
        }
    }
    @ResponseBody
    @RequestMapping("/updateBlogger")
    public String updateBlogger(Blogger blogger){
        boolean b = bloggerService.updateBlogger(blogger);

        if(b){
            return "true";
        }else {
            return "修改失败,请重试!";
        }
    }




}
