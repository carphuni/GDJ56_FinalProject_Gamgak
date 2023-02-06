package com.gamgak.kch.ranking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RankingDao {

	@Select("SELECT * FROM(SELECT COUNT(*) AS COUNT ,RES_NO FROM MYRES GROUP BY RES_NO ORDER BY COUNT DESC) JOIN RESTAURANT USING (RES_NO) WHERE RES_LAT BETWEEN ${swLat} AND ${neLat} AND RES_LON BETWEEN ${swLon} AND ${neLon}")
	List<Map> searchPlace(double swLat,double swLon,double neLat,double neLon);

	//카테고리별 검색
	@Select("SELECT * FROM(SELECT * FROM(SELECT ROWNUM AS \"YES_RANK\", Y.* FROM(SELECT COUNT(*)AS \"YES_COUNT\", RES_NO FROM MYRES JOIN RESTAURANT USING (RES_NO) WHERE RES_CATEGORY LIKE '%${tag}%' AND TO_CHAR(MYRES_SAVE_DATE, 'yy/MM/dd')!=TO_CHAR(SYSDATE, 'yy/MM/dd') GROUP BY RES_NO ORDER BY YES_COUNT DESC)Y) JOIN(SELECT ROWNUM AS \"TO_RANK\", T.* FROM(SELECT COUNT(*) AS \"TO_COUNT\", RES_NO FROM MYRES JOIN RESTAURANT USING (RES_NO) WHERE RES_CATEGORY LIKE '%${tag}%' GROUP BY RES_NO ORDER BY TO_COUNT DESC)T) USING (RES_NO))JOIN RESTAURANT USING (RES_NO) WHERE TO_RANK BETWEEN 1 AND 10")
	List<Map> rankingCategory(String tag);
	
	//인기순위에서 식당 이름 클릭
	@Select("SELECT * FROM RESTAURANT WHERE RES_NO=#{resNo}")
	Map rankingListClick(int resNo);
}
