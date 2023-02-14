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


function deleteMyres(value){
    console.log(value);
    let flag=confirm("정말 삭제하시겠습니까?");
    if(flag){
        $.ajax({
            type: "GET",
            url: "/GDJ56_gamgak_final/profile/deletetMyres",
            data: {"myResNo":value},
            error: function() {
                console.log('통신실패!!');
            },
            success: function(result) {
                alert(result);
                location.reload(); 
            }
        });
    }else{
        alert("취소하셨습니다");
    }
}

$("button#deleteMyres").off('click').click((e)=>{
    deleteMyres($(e.target).val());
})




