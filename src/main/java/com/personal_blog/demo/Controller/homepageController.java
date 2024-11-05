package com.personal_blog.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.personal_blog.demo.DTO.RegisterDTO;
import com.personal_blog.demo.Service.ArticleService;
import com.personal_blog.demo.Service.UserService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class homepageController {
    private ArticleService articleService;
    private UserService userService;

    public homepageController(ArticleService articleService, UserService userService) {
        this.articleService = articleService;
        this.userService = userService;
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
    public String handleRegister(@ModelAttribute("register") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        userService.handleRegister(registerDTO);
        return "redirect:/login";
    }

}
