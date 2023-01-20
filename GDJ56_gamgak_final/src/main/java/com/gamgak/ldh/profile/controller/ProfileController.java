package com.gamgak.ldh.profile.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class ProfileController {


	@RequestMapping("/profile")
	public String profile() {
		return "ldh_profile/profile";
	}
}
