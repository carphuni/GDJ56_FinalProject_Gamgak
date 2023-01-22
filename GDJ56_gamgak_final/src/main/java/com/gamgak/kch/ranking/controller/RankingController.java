package com.gamgak.kch.ranking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RankingController {
	
	@RequestMapping("/ranking")
	public String ranking() {
		return "kch_ranking/ranking";
	}
}
