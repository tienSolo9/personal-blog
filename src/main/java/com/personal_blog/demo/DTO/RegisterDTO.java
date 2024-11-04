package com.personal_blog.demo.DTO;

public class RegisterDTO {
    private String username;
    private String password;
    private String confirmPasword;

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

    public String getConfirmPasword() {
        return confirmPasword;
    }

    public void setConfirmPasword(String confirmPasword) {
        this.confirmPasword = confirmPasword;
    }

}
