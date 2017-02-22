package com.andywooh.xiaoman.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.andywooh.xiaoman.service.IloginService;

public class LoginControllerTest extends BaseControllerTest {

	private MockMvc mockMvc;
	@Autowired
	private IloginService loginService;
    @Before  
    public void setUp() throws Exception {
         mockMvc = MockMvcBuilders.standaloneSetup(loginService).build(); 
    }

    @Test
    public void testLogin() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/login"))
//                .andExpect(MockMvcResultMatchers.view().name("toMainPage"))
                .andExpect(MockMvcResultMatchers.view().name("toMainPage"))
                .andReturn();
    }

}
