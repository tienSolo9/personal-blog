package com.personal_blog.demo.Controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.personal_blog.demo.DTO.ParamDTO;
import com.personal_blog.demo.Service.UserService;
import com.personal_blog.demo.domain.User;
import com.personal_blog.demo.util.CheckParam;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {

    private final UserService userService;

    UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/user")
    public String getUser(Model model, ParamDTO paramDTO) {
        Page<User> uPage = this.userService.fetchUsers(paramDTO);
        List<User> users = uPage.getContent();

        int currentPage = CheckParam.checkPage(paramDTO);
        int totalPage = uPage.getTotalPages();
        model.addAttribute("users", users);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPage", totalPage);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/detail/{id}")
    public String getUserDetail(Model model, @PathVariable long id) {
        User user = this.userService.fetchById(id);

        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create")
    public String getUserCreate(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/create";
    }

    @GetMapping("/admin/user/create/{id}")
    public String getUserUpdate(Model model, @PathVariable long id) {
        User user = this.userService.fetchById(id);

        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/create";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getUserDelete(Model model, @PathVariable long id) {

        model.addAttribute("id", id);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/create")
    public String handleCreate(@ModelAttribute("user") User user,
            @RequestParam("myFile") MultipartFile file) {

        this.userService.newUser(user, file);
        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/delete")
    public String handleDelete(@RequestParam("id") long id) {
        this.userService.deleteUser(id);
        return "redirect:/admin/user";
    }
}
