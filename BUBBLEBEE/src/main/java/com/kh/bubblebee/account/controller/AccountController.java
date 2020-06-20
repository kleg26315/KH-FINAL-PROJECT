package com.kh.bubblebee.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.bubblebee.account.model.service.AccountService;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService acService;
	
	
}
