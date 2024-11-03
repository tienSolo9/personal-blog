package com.personal_blog.demo.util;

import com.personal_blog.demo.DTO.ParamDTO;

public class CheckParam {
    public static int checkPage(ParamDTO paramDTO) {
        if (paramDTO.getPage() != null && paramDTO.getPage().isPresent()) {
            try {
                int page = Integer.parseInt(paramDTO.getPage().get());
                if (page <= 0)
                    return 1;
                return page;
            } catch (Exception e) {
                // TODO: handle exception
            }
        }
        return 1;
    }
}
