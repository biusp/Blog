package com.blog.controller;

import com.blog.pojo.Link;
import com.blog.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author shkstart
 * @create 2021-03-05 17:28
 */
@Controller
public class LinkController {
    @Autowired
    LinkService service;


    @RequestMapping("/getLinks")//获取所有的博客类型
    public String getLinks(Model model, HttpSession session){
        List<Link> links = service.getLinks();
        session.setAttribute("links",links);
        return "foreground/index";
    }

    @RequestMapping("/addLink")
    public String addLink(Link link, HttpSession session){
        service.addLink(link);
        List<Link> links = service.getLinks();
        session.setAttribute("links",links);//更新数据
        return "admin/linkManage";

    }

    @RequestMapping("/deleteLink")
    public String deleteLink(Integer id, HttpSession session,Model model){
        service.deleteLink(id);
        List<Link> links = service.getLinks();
        session.setAttribute("links",links);//更新数据
        return "admin/linkManage";
    }

    @RequestMapping("/editLink")
    public String editLink(Integer id,Model model){
        Link linkById = service.getLinkById(id);
        model.addAttribute("link",linkById);
        return "admin/editLink";
    }

    @RequestMapping("/updateLink")
    public String updateLink(Link link, HttpSession session){
        service.updateLink(link);
        List<Link> links = service.getLinks();
        session.setAttribute("links",links);//更新数据
        return "admin/linkManage";
    }

    @ResponseBody
    @RequestMapping("/ajaxUrlIdExist")
    public String ajaxUrlIdExist(Integer id){
        Link linkById = service.getLinkById(id);

        return linkById==null?"false":"true";

    }
}
