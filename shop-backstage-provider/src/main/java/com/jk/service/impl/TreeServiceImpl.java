package com.jk.service.impl;

import com.jk.dao.TreeMapper;
import com.jk.model.Tree;
import com.jk.service.ITreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/8.
 */
@Service("treeService")
public class TreeServiceImpl implements ITreeService{

    @Autowired
    private TreeMapper treeMapper;
    public List<Tree> queryTreeList() {
        List<Tree> treeList = treeMapper.queryTreeList();
        return treeList;
    }
}
