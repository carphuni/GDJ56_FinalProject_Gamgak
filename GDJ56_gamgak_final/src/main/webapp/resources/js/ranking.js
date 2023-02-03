function rankingList(data){
	$("#topten1").empty();
	$("#topten2").empty();
	$("#change1").empty();
	$("#change2").empty();
	let num=5;
	if(data.length<5){
		num=data.length;
	}
	//1~5위 출력
	for(var i=0;i<num;i++){
		const $div=$("<div>").css({"display":"flex","padding":"10px"});
		const $b=$("<b>").css({"margin-right":"10px"});
		const $a=$("<a>");
		$b.text(i+1);
		$a.text(data[i].RES_NAME);
		$div.append($b);
		$div.append($a);
		$("#topten1").append($div);
	}
	//6~10위 출력
	for(var i=5;i<data.length;i++){
		const $div=$("<div>").css({"display":"flex","padding":"10px"});
		const $b=$("<b>").css({"margin-right":"10px"});
		const $a=$("<a>");
		$b.text(i+1);
		$a.text(data[i].RES_NAME);
		$div.append($b);
		$div.append($a);
		$("#topten2").append($div);
	}
	//1~5위 순위변동 출력
	for(var i=0;i<num;i++){
		if(data[i].YES_RANK==null||data[i].YES_RANK>10){
			const $p=$("<p>").css("color","#F2CB61");
			$p.text("N");
			$("#change2").append($p);
		}else if(data[i].TO_RANK<data[i].YES_RANK){
			const $p=$("<p>").css("color","#dc3545");
			$p.text("▲"+" "+String(data[i].YES_RANK-data[i].TO_RANK));
			$("#change2").append($p);
		}else if(data[i].TO_RANK==data[i].YES_RANK){
			const $p=$("<p>").css("font-weight","bold");
			$p.text("-");
			$("#change2").append($p);
		}else if(data[i].TO_RANK>data[i].YES_RANK){
			const $p=$("<p>").css("color","rgb(99, 155, 230)");
			$p.text("▼"+" "+String(data[i].TO_RANK-data[i].YES_RANK));
			$("#change2").append($p);
		}
	}
	//6~10위 순위변동 출력
	for(var i=5;i<data.length;i++){
		if(data[i].YES_RANK==null||data[i].YES_RANK>10){
			const $p=$("<p>").css("color","#F2CB61");
			$p.text("N");
			$("#change1").append($p);
		}else if(data[i].TO_RANK<data[i].YES_RANK){
			const $p=$("<p>").css("color","#dc3545");
			$p.text("▲"+" "+String(data[i].YES_RANK-data[i].TO_RANK));
			$("#change1").append($p);
		}else if(data[i].TO_RANK==data[i].YES_RANK){
			const $p=$("<p>").css("font-weight","bold");
			$p.text("-");
			$("#change1").append($p);
		}else if(data[i].TO_RANK>data[i].YES_RANK){
			const $p=$("<p>").css("color","rgb(99, 155, 230)");
			$p.text("▼"+" "+String(data[i].TO_RANK-data[i].YES_RANK));
			$("#change1").append($p);
		}
	}
	
}