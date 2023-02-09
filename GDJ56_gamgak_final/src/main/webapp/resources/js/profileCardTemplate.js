myresNos=$("input[name=myresNos]")[$("input[name=myresNos]").length-1].value;
myresNosSplit=myresNos.split(",");
myresMapX=$("input[name=x]").val().split(",");
myresMapY=$("input[name=y]").val().split(",");
for(let v in myresNosSplit){
    myresMapTag="#myresCardModal"+myresNosSplit[v];
    
    $(myresMapTag).on('shown.bs.modal',()=>{

        new kakao.maps.Marker({
            position: new kakao.maps.LatLng(myresMapY[v], myresMapX[v])
        }).setMap(
                new kakao.maps.Map(
                    document.getElementById('myresMap'+myresNosSplit[v]), 
                    { 
                        center: new kakao.maps.LatLng(myresMapY[v], myresMapX[v]), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    }
                )
          );
    });
}


