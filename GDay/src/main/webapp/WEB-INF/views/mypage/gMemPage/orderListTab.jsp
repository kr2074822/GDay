<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.tab-radio { display : none; }

.tab-label {
    cursor: pointer;
    width : 50%;
    height : 50px;
    margin: 10px 0px 0px 0px;
    
    border : 0px solid transparent;
    color : #806f7181;
    text-align: center;
    line-height: 50px;
}

.tab-label:hover {
    color:#FE929F;
    font-size : 18px;
    transition-duration: 0.5s;
}

.tabs { 
		display: flex;
		justify-content : center;
		width : 100%;
		margin-bottom : -2px; 
		z-index : 1;
}
.wrapper-tab {
		display : flex;
		flex-direction : column;
		align-items : center;
		justify-content : centent;
    width : 100%;
    padding : 20px;
    border-top: 2px solid #806f71;
    /* border-bottom: 2px solid #806f71; */
    background-color: #ffffff;
    margin : 0px;
    box-sizing : border-box;
}

.wrap-tab-r { display : none; }

.tab-active {
    color : #FE929F;
    font-size : 18px;
    font-weight: bold;
    background-color : #ffffff;
    border-top : 3px solid #FE929F;
    border-bottom: 2px solid #ffffff;
    margin: 10px 0 0 0;
}
</style>

<script>
	$(function(){
		
    $(".tabs .tab-label").on("click", function(){
        if(!$(this).prev().attr("checked")){

           $(this).addClass("tab-active");
           $(this).siblings(".tab-label").removeClass("tab-active");
					$(this).prev().attr("checked", true);
					$(this).prev().siblings().attr("checked", false);
           
           if($(this).hasClass("tab-l")){
               $(".wrap-tab-l").show();
               $(".wrap-tab-r").hide();
               
            } else if($(this).hasClass("tab-r")){
                $(".wrap-tab-r").show();
                $(".wrap-tab-l").hide();
           }
           
        } 
        
        loadTab();
    });
	});
</script>
