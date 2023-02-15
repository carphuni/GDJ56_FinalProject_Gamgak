function addMsgSystem(msg){
    
  
     const $h3=$("<h5>").css("textAlign","center").text("======="+msg.msg+"=======");
	$("#chattingRoom").append($h3);
    
	$('#chattingRoom').scrollTop($('#chattingRoom')[0].scrollHeight);
	 
     
}


function printMsg(myId,msg){
    //  const $p=$("<p>").attr("id","ontherMsg").css("color","blue").css("textAlign",(myId==msg.memberSender?"right":"left"))
    //          .text(`${msg.memberSender} : ${msg.chattingContent}`);
    //          $("#chattingRoom").append($p);
    // const myMsgwaf=$("div").attr("id","myMsgwaf")
    // const $p=$("<p>");
    // $p.text(`${msg.chattingContent}`);
    console.log("myId"+myId);
    console.log("sender"+msg.memberSender);
    console.log("msg"+msg);

    if(myId==msg.memberSender){
         $myp=$("<p>").attr("id","myp");
         $myp.text(`${msg.chattingContent}`);
    }else{
         $ontherp=$("<p>").attr("id","ontherp");
         $ontherp.text(`${msg.chattingContent}`);
    }


    if(myId==msg.memberSender){
        const $mydiv=$("<div>").attr("id","myMsgwaf")
        const $myNameChat=$("<div>").attr("id","myNameChat");
        const $mycheck=$("<span>").attr("id","mycheck").text("my").css("textAlign","right")
        $myp.css("textAlign","right");

        $myNameChat.append($mycheck)
        $myNameChat.append($myp)
        //$mydiv.append($mycheck)
        $mydiv.append($myNameChat)
        $("#chattingRoom").append($mydiv);

    }else{
        const $ontherMsgwaf=$("<div>").attr("id","ontherMsgwaf");
        const $ontherNameChat=$("<div>").attr("id","ontherNameChat");
        const $ontherImg=$("<img>").attr("id","ontherImg");
        const $ontherNickName=$("<span>").attr("id","ontherNickName").text(`${msg.memberSender}`);
        $ontherp.css("background","white")

        $ontherNameChat.append($ontherNickName);
        $ontherNameChat.append($ontherp);

        $ontherp.css("textAlign","left");
        $ontherNameChat.append
       
        $ontherMsgwaf.append($ontherImg);
        $ontherMsgwaf.append($ontherNameChat);
        $("#chattingRoom").append($ontherMsgwaf);
    }
	
	$('#chattingRoom').scrollTop($('#chattingRoom')[0].scrollHeight);

}


