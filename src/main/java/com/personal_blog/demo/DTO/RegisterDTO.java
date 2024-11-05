package com.personal_blog.demo.DTO;

import com.personal_blog.demo.Service.validation.VRegister;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@VRegister
public class RegisterDTO {
    @NotEmpty(message = "User must not be empty")
    private String username;

    @NotNull
    @NotEmpty(message = "Password has at least 6 character")
    private String password;

    private String confirmPassword;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
