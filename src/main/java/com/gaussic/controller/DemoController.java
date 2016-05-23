package com.gaussic.controller;

import com.gaussic.model.UserEntity;
import com.gaussic.model.UserListForm;
import com.gaussic.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dzkan on 2016/5/24.
 */
@Controller
public class DemoController {

    @Autowired
    UserRepository userRepository;

    // 首页
    @RequestMapping("/")
    public String index(ModelMap model) {
        model.addAttribute("user_cnt", userRepository.count());
        return "index";
    }

    // 指向批量添加用户页面
    @RequestMapping("/users")
    public String users() {
        return "users";
    }

    // 添加用户，post 请求
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(UserListForm userListForm, ModelMap model) {

        List<UserEntity> succeedList = new ArrayList<>();  // 添加成功
        List<UserEntity> failList = new ArrayList<>();     // 添加不成功
        for(UserEntity user : userListForm.getUsers()) {
            if(userRepository.countByFirstNameAndLastName(user.getFirstName(), user.getLastName()) == 0) {
                userRepository.saveAndFlush(user);
                succeedList.add(user);
            } else {
                failList.add(user);
            }
        }

        model.addAttribute("succeedList", succeedList);
        model.addAttribute("failList", failList);
        return "user_list";
    }
}
