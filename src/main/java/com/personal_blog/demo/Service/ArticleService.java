package com.personal_blog.demo.Service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.personal_blog.demo.DTO.ParamDTO;
import com.personal_blog.demo.Repository.ArticleRes;
import com.personal_blog.demo.domain.Article;

@Service
public class ArticleService {
    private ArticleRes articleRes;

    public ArticleService(ArticleRes articleRes) {
        this.articleRes = articleRes;
    }

    public List<Article> fetchAll() {
        return this.articleRes.findAll();
    }

    public Page<Article> fetchPage(int currentPage) {
        Pageable pageable = PageRequest.of(currentPage - 1, 3);
        return this.articleRes.findAll(pageable);
    }

    public void handleCreate(Article article) {
        this.articleRes.save(article);
    }

    public Article fetchById(long id) {
        return this.articleRes.findById(id).get();
    }

    public void deleteById(long id) {
        this.articleRes.deleteById(id);
    }
}
