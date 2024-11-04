package com.personal_blog.demo.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.personal_blog.demo.domain.Article;

@Repository
public interface ArticleRes extends JpaRepository<Article, Long> {
    Page<Article> findAll(Pageable pageable);
}
