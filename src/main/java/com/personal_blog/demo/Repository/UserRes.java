package com.personal_blog.demo.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.personal_blog.demo.domain.User;

@Repository
public interface UserRes extends JpaRepository<User, Long> {
    Page<User> findAll(Pageable pageable);

    User findByUsername(String username);
}
