package com.gamgak.kch.ranking.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamgak.kch.ranking.dao.RankingDao;

@Service
public class RankingService {

	private SqlSessionTemplate session;
	private RankingDao dao;
	
	@Autowired
	public RankingService(SqlSessionTemplate session, RankingDao dao) {
		this.session=session;
		this.dao=dao;
	}
	
	public List<Map> searchPlace(double swLat,double swLon,double neLat,double neLon){
		return dao.searchPlace(swLat,swLon,neLat,neLon);
	}

	//카테고리별 검색
	public List<Map> rankingCategory(String tag){
		return dao.rankingCategory(tag);
	}
	
	//인기순위에서 식당 이름 클릭
	public Map rankingListClick(int resNo) {
		return dao.rankingListClick(resNo);
	}
	
}
