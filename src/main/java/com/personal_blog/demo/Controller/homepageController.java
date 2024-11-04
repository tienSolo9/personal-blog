package com.personal_blog.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.personal_blog.demo.DTO.RegisterDTO;
import com.personal_blog.demo.Service.ArticleService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class homepageController {
    private ArticleService articleService;

    public homepageController(ArticleService articleService) {
        this.articleService = articleService;
    }

    @GetMapping("/")
    public String getMethodName(Model model) {
        model.addAttribute("articles", this.articleService.fetchAll());
        return "client/homepage";
    }

    @GetMapping("/login")
    public String getLogin() {
        return "client/auth/login";
    }

    @GetMapping("/register")
    public String getRegister() {
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(RegisterDTO registerDTO) {

        return "redirect:/login";
    }

}
