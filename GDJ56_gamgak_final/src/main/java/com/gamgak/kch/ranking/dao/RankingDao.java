package com.gamgak.kch.ranking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RankingDao {

	@Select("SELECT * FROM RESTAURANT WHERE RES_LAT BETWEEN ${swLat} AND ${neLat} AND RES_LON BETWEEN ${swLon} AND ${neLon}")
	List<Map> searchPlace(double swLat,double swLon,double neLat,double neLon);
}
