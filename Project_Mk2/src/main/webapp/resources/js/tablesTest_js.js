// 관리자 테이블 삭제버튼 클릭
function delete_info(basNo) {
	if(confirm("삭제하시겠습니까?")){
	  $.ajax({
	         url:"delete_info",
	         type:"get",
	         async:false,
	         data:{
	        	 basNo : basNo
	         },
	         dataType: "json",
	            success:function(){
					location.reload();
	             },error : function () {
	                console.log('fail')
	             } 
	       });
	}
}

// 화장실 정보 가지오는 팝
function showToiletDetail(){
        $.ajax({
        url:"toiletDetail",
        type:"get",
        dataType: "json",
        async:false,
           success:function(toiletInfo){
            var j = Object.values(toiletInfo)
            for(var i = 0; i < j.length; i++){
               matchNum=0;
                   var sum = 0;
                   var avg = 0;
                   for(var a =0; a<reviewList.length;a++){
                        if(j[i].basNo == reviewList[a].number){
                             sum += reviewList[a].reSco 
                             matchNum ++;
                        }
                    }
                    if(sum!=0){
                      avg = (sum/matchNum).toFixed(2);
                   }else {
                      avg = 0.00;
                   }
                   if( j[i].restLock == 'N'){
                   	lock = '열림'
                   }else {
                   	lock = '잠김'
                   }        
                   if( j[i].restStatus == 'Clean'){
                   	status = '깨끗함'
                   }else {
                   	status = '더러움'
                   }        
                 detailList[i] = {
                       number : j[i].basNo,                       
                       overrayContent : '<div id="ditailInfoWindow">'+
                             '<div id ="detailInfo">'+
                             '<div id="basName">'+
                                '<div id="bas_Name">'+j[i].basName+'</div>'+
                             '<div id="avg"><span id="star">★</span><span>'+ avg +'</span></div>'+
                             '</div>'+
                              '<div id="clear"></div><div><span id="basAddr">주소</span><label id="bas_addr">&nbsp;'+ j[i].basAddr + '</label></div>'+
                               '<div id="restContent">'+
                                  '<div class="restContent1"><span id="rest-Uri">소변기</span><label id="bas_content">&nbsp;'+ j[i].restUri + '</label></div>'+
                                  '<div class="restContent1"><span id="rest-Toi">대변기</span><label id="bas_content">&nbsp;'+ j[i].restToi + '</label></div>'+
                                  '<div class="restContent2"><span id="rest-Lock">잠금유무</span><label id="bas_content">&nbsp;'+ lock + '</label></div>'+
                                  '<div class="restContent2"><span id="rest-Status">청결상태</span><label id="bas_content">&nbsp;'+status + '</label></div>'+
                               '</div>'+
                             '</div>'+
                             '<div id="overFlow"style="overflow: auto;">'
                 }
                   matchNum = 0;
                    for(var a =0; a<reviewList.length;a++){                       
                        if(detailList[i].number == reviewList[a].number){
                             detailList[i].overrayContent += reviewList[a].overrayContent    
                             //리뷰가 있는지 없는지 확인하는 변수
                             matchNum ++;
                        }
                    }
                 if(matchNum==0){
                     detailList[i].overrayContent += '<div id="review">리뷰가 없습니다. 리뷰를 작성해주세요</div>'                         
                    } 
                 detailList[i].overrayContent += 
                  '</div><div id="reply-Form">'+
                     '<form name="      var formData = $("#join_form").serialize(); " id="replyForm">'+
                      '<div id="reviewSend">'+
                          '<span id="form_title">리뷰작성</span>'+
                         '<div id="selectStart">'+
                                '<fieldset>'+
                                  '<input type="radio" name="reSco" value="5" id="rate1" checked><label for="rate1">★</label>'+
                                 '<input type="radio" name="reSco" value="4" id="rate2"><label for="rate2">★</label>'+
                                  '<input type="radio" name="reSco" value="3" id="rate3"><label for="rate3">★</label>'+
                                  '<input type="radio" name="reSco" value="2" id="rate4"><label for="rate4">★</label>'+
                                  '<input type="radio" name="reSco" value="1" id="rate5"><label for="rate5">★</label>&nbsp;'+
                                  '<span class="selectText">별점을 선택해주세요</span>'+
                               '</fieldset>'+
                        '</div><br>'+
                          '<input type="text" id="reply" name="reContent" size="35" maxlength="15" placeholder="최대등록글자는 15자입니다.">&nbsp;'+
                          '<input type="hidden" id="basNo" name="basNo" value="'+j[i].basNo+'">'+
                          '<a id="replySend" onclick="popReply()"><img id="send-icon" src="resources/img/send_icon.png" width="8%" height="8%"></a>'+
                       '</div>'+
                    '</form>'+
                 '</div>'+
                 '</div>'
          }
            },error : function () {
               console.log('fail')
            } 
      });
}
