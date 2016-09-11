package com.xy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ExceptionHandler;
/**
 * 处理异常
 * @author soonsmile
 *
 */
public class DealException {
	/** 基于@ExceptionHandler异常处理 */  
    @ExceptionHandler  
    public String exp(HttpServletRequest request, Exception ex) {  
        request.setAttribute("ex", ex);  
        // 根据不同错误转向不同页面  
        if(ex instanceof NullPointerException) {  
            return "error";  
        }else if(ex instanceof ClassCastException) {  
            return "error";  
        }else if(ex instanceof IllegalArgumentException){  
            return "error";  
        }
		return null;  
    }  
}
