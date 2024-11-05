package com.personal_blog.demo.Service.validation;

import com.personal_blog.demo.DTO.RegisterDTO;
import com.personal_blog.demo.Service.UserService;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class RegisterValidation implements ConstraintValidator<VRegister, RegisterDTO> {

    private UserService userService;

    public RegisterValidation(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO registerDTO, ConstraintValidatorContext cxt) {
        boolean isValid = true;
        if (!registerDTO.getPassword().equals(registerDTO.getConfirmPassword())) {
            cxt.buildConstraintViolationWithTemplate("Password not match")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            isValid = false;
        }
        if (userService.checkUsernameExists(registerDTO.getUsername())) {
            cxt.buildConstraintViolationWithTemplate("Username was existed")
                    .addPropertyNode("username")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            isValid = false;
        }
        return isValid;
    }

}
