package com.personal_blog.demo.Controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.personal_blog.demo.DTO.ParamDTO;
import com.personal_blog.demo.Service.ArticleService;
import com.personal_blog.demo.domain.Article;
import com.personal_blog.demo.util.CheckParam;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ArticleController {
    private ArticleService articleService;

    public ArticleController(ArticleService articleService) {
        this.articleService = articleService;
    }

    @GetMapping("/admin")
    public String getAdminPage(Model model) {
        return "admin/dashboard";
    }

    @GetMapping("/admin/article")
    public String getArticles(Model model, ParamDTO paramDTO) {
        int currentPage = CheckParam.checkPage(paramDTO);
        Page<Article> articlePage = this.articleService.fetchPage(currentPage);
        List<Article> articles = articlePage.getContent();

        model.addAttribute("articles", articles);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPage", articlePage.getTotalPages());
        return "admin/article/show";
    }

    @GetMapping("/admin/article/{id}")
    public String getArticleDetail(Model model, @PathVariable long id) {
        Article article = this.articleService.fetchById(id);
        model.addAttribute("article", article);
        return "admin/article/detail";
    }

    @GetMapping("/admin/article/create")
    public String getArticleCreate(Model model) {
        model.addAttribute("article", new Article());
        return "admin/article/create";
    }

    @GetMapping("/admin/article/create/{id}")
    public String getArticleUpdate(Model model, @PathVariable long id) {

        model.addAttribute("article", articleService.fetchById(id));
        return "admin/article/create";
    }

    @GetMapping("/admin/article/delete/{id}")
    public String getArticleDelete(Model model, @PathVariable long id) {

        model.addAttribute("id", id);
        return "admin/article/delete";
    }

    @PostMapping("/admin/article/create")
    public String createOrUpdateArticle(Model model, @ModelAttribute("article") Article article) {
        this.articleService.handleCreate(article);
        return "redirect:/admin/article";
    }

    @PostMapping("/admin/article/delete")
    public String deleteArticle(@RequestParam("id") long id) {
        this.articleService.deleteById(id);
        return "redirect:/admin/article";
    }
}
