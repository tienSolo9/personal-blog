package com.personal_blog.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.personal_blog.demo.domain.Role;

@Repository
public interface RoleRes extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
