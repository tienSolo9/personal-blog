package com.personal_blog.demo.DTO;

import java.util.Optional;

public class ParamDTO {
    private Optional<String> page;

    public Optional<String> getPage() {
        return page;
    }

    public void setPage(Optional<String> page) {
        this.page = page;
    }

    
}
