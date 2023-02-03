package com.gamgak.kch.ranking.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamgak.kch.ranking.service.RankingService;

@Controller
public class RankingController {
	
	private RankingService service;
	
	@Autowired
	public RankingController(RankingService service) {
		this.service=service;
	}
	
	@RequestMapping("/ranking")
	public String ranking() {
		return "kch_ranking/ranking";
	}
	
	@RequestMapping("/map/searchRes")
	@ResponseBody
	public List<Map> searchPlace(
			@RequestParam(value="swLat") double swLat,
			@RequestParam(value="swLon") double swLon,
			@RequestParam(value="neLat") double neLat,
			@RequestParam(value="neLon") double neLon) {
		List<Map> list=service.searchPlace(swLat,swLon,neLat,neLon);
		return list;
	}

	//카테고리별 검색
	@RequestMapping("/rankingCategory.do")
	@ResponseBody
	public List<Map> rankingCategory(String tag){
		List<Map> list=service.rankingCategory(tag);
		return list;
	}
}
