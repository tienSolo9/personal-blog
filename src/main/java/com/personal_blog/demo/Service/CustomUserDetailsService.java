package com.personal_blog.demo.Service;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.personal_blog.demo.Repository.UserRes;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    private UserRes userRes;

    public CustomUserDetailsService(UserRes userRes) {
        this.userRes = userRes;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        com.personal_blog.demo.domain.User user = userRes.findByUsername(username);

        if (user == null) {
            throw new UnsupportedOperationException("Unimplemented method 'loadUserByUsername'");
        }

        return new User(
                user.getUsername(),
                user.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + user.getRole().getName())));
    }

}
