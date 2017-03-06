package com.andywooh.xiaoman.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HistoryItemsController extends AbstractController {
	
	@Autowired
//	private IloginService loginService;
	
	@RequestMapping(value = "history/list-items", method = RequestMethod.GET)
	public String listItems() {

		return "history_items";

	}
}
