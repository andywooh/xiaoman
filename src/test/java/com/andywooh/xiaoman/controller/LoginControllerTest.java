package com.andywooh.xiaoman.controller;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.andywooh.xiaoman.service.IloginService;

@Controller
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
                .andExpect(MockMvcResultMatchers.view().name("toMainPage"))
                .andReturn();  
    }  
}
