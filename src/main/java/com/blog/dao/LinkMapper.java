package com.blog.dao;

import com.blog.pojo.Link;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author shkstart
 * @create 2021-03-05 17:19
 */
@Repository
public interface LinkMapper {
    List<Link> getLinks();

    Link getLinkById(Integer id);

    boolean addLink(Link link);

    boolean deleteLink(Integer id);

    boolean updateLink(Link link);
}
