function setDisplay(){
    // 체크박스 선택에 따라 어떠한 클래스를 보여주고 숨길지 정하는 함수입니다.
    
    let $front = $("#front_parts"); //프론트 클래스
    let $side = $("#side_parts");	//사이드 클래스
    let $rear = $("#rear_parts");	//리어 클래스
    let $etc = $("#etc");			//실내,전장클래스
    let $engine = $("#engine_lower_body");//엔진클래
    $(".front_parts").hide(); 
    $(".side_parts").hide(); 
    $(".rear_parts").hide(); 
    $(".etc").hide(); 
    $(".engine_lower_body").hide(); 
    $(".parts_radio").hide(); // 세부부품 체크부분의 구역자체를 숨겨준다. 
    							//체크박스에서 체크한 후에 다시 모든 체크박스의 체크를 해제하면 빈공간이 남아서
    
    if($front.is(':checked')){ 
        $(".front_parts").show(); 
        $(".parts_radio").show();
    }                     
    
    if($side.is(':checked')){ 
        $ (".side_parts").show(); 
        $(".parts_radio").show();
    }
    if($rear.is(':checked')){ 
        $(".rear_parts").show(); 
        $(".parts_radio").show();
    }
    if($etc.is(':checked')){
        $(".etc").show();
        $(".parts_radio").show();
    }
    if($engine.is(':checked')){
        $(".engine_lower_body").show(); 
        $(".parts_radio").show();
    }

}