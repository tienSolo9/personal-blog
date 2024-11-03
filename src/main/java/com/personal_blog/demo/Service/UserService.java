package com.personal_blog.demo.Service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.personal_blog.demo.DTO.ParamDTO;
import com.personal_blog.demo.Repository.RoleRes;
import com.personal_blog.demo.Repository.UserRes;
import com.personal_blog.demo.domain.Role;
import com.personal_blog.demo.domain.User;
import com.personal_blog.demo.util.CheckParam;

@Service
public class UserService {

    private final UserRes userRes;
    private final RoleRes rolRes;
    private final UploadFile uploadFile;

    UserService(UserRes userRes, RoleRes rolRes, UploadFile uploadFile) {
        this.userRes = userRes;
        this.rolRes = rolRes;
        this.uploadFile = uploadFile;
    }

    public Page<User> fetchUsers(ParamDTO paramDTO) {
        int pageSize = CheckParam.checkPage(paramDTO);
        Pageable pageable = PageRequest.of(pageSize - 1, 3);
        return this.userRes.findAll(pageable);
    }

    public void newUser(User user, MultipartFile file) {
        if (file != null && !file.getOriginalFilename().equals("")) {
            String myImage = uploadFile.handleSaveFile(file);
            user.setImages(myImage);
        }
        Role role = this.rolRes.findByName(user.getRole().getName());
        user.setRole(role);

        if (user.getId() == 0) {
            this.userRes.save(user);
        } else {
            User userUpdated = this.userRes.findById(user.getId()).get();
            String img = userUpdated.getImages();
            userUpdated = user;
            // unchanged image
            if (user.getImages() == null || user.getImages().equals("")) {
                userUpdated.setImages(img);
            }
            this.userRes.save(userUpdated);
        }

    }

    public User fetchById(long id) {
        return this.userRes.findById(id).get();
    }

    public void deleteUser(long id) {
        this.userRes.deleteById(id);
    }
}
