package com.fh.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class LoginController {
    Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping("/userLogin")
    public String userLogin(String username, String password){
        // 获取前的Subject
        Subject subject = SecurityUtils.getSubject();
        // 判断是否登录
        if(!subject.isAuthenticated()){
            // 如果没有登录则把用户名和密码封装为UsernamePasswordToken
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            // 设置记住我,这里的记住我不是记住密码，而是关闭页面之后再次访问不需要登录
            token.setRememberMe(true);
            try {
                // 执行登录
                subject.login(token);
            }catch (AuthenticationException e){
                logger.error("登录失败:"+e.getMessage());
            }
        }
        return "redirect:/jsp/list.jsp";
    }
}
