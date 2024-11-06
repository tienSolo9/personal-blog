package com.personal_blog.demo.Controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.personal_blog.demo.DTO.ParamDTO;
import com.personal_blog.demo.DTO.RegisterDTO;
import com.personal_blog.demo.Service.ArticleService;
import com.personal_blog.demo.Service.UserService;
import com.personal_blog.demo.domain.Article;
import com.personal_blog.demo.util.CheckParam;

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
    public String getMethodName(Model model, ParamDTO paramDTO) {
        int currentPage = CheckParam.checkPage(paramDTO);
        Page<Article> articlePage = this.articleService.fetchPage(currentPage);
        List<Article> articles = articlePage.getContent();

        model.addAttribute("articles", articles);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPage", articlePage.getTotalPages());
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
