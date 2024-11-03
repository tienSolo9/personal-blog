package com.personal_blog.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class homepageController {
    @GetMapping("/")
    public String getMethodName() {
        return "client/homepage";
    }

    @GetMapping("/login")
    public String getLogin() {
        return "client/auth/login";
    }
}
