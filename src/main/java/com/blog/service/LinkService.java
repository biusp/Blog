package com.blog.service;

import com.blog.dao.LinkMapper;
import com.blog.pojo.Link;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2021-03-05 17:21
 */
@Service
public class LinkService {
    @Autowired
    LinkMapper mapper;

    public List<Link> getLinks() {
        return mapper.getLinks();

    }

    public Link getLinkById(Integer id) {

        return mapper.getLinkById(id);
    }

    public boolean addLink(Link link){
        return mapper.addLink(link);
    }

    public boolean deleteLink(Integer id){
        return mapper.deleteLink(id);
    }

    public boolean updateLink(Link link){
        return mapper.updateLink(link);
    }
}
