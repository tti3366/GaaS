<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 
  		이미지 슬라이드
  		동아리 이미지주소나 jpg파일을 db에 넣고 가져오면 좋지 않을까
  		
  		밑에는 임시로 갖다 넣은거
-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
<script src="/assets/js/jquery.marquee.js"></script>

<!-- 롤링배너 style -->
  <style>

	.block{
	    display:inline-block;
	    margin-right: 60px;
	}
	.sliderImg{
		width: 400px;
		height: 200px;
		
	}
  </style>
  
  

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="marquee_text">
		<div class="block">
        	<img class="sliderImg" src="https://www.yc.ac.kr/site/smartsw/img/sub/sub3_5_img01.jpg" onclick="location.href='https://www.naver.com'">
        	<br>
        	소프트웨어 triple S
    	</div>
	    <div class="block">
	       <img class="sliderImg" src="/assets/img/Advanced Smart Software.png" onclick="location.href='https://www.naver.com'">
	       <br>
	       스마트전기전자-ECO
	    </div>
	    <div class="block">
	       <img class="sliderImg" src="/assets/img/Electrical Electronic Engineering.png" onclick="location.href='https://www.naver.com'">
	       <br>
	       전기전자-스마트그리드 연구회
	    </div>
	    <div class="block">
	       <img class="sliderImg" src="https://www.yc.ac.kr/site/smartsw/img/sub/sub3_5_img02.jpg" onclick="location.href='https://www.naver.com'">
	       <br>
	       소프트웨어 Yonam Ingenuity
	    </div>
	    <div class="block">
	       <img class="sliderImg" src="https://www.yc.ac.kr/site/smartsw/img/sub/sub3_5_img03.jpg" onclick="location.href='https://www.naver.com'">
	       <br>
	       소프트웨어 Open AI
	    </div>
	    <div class="block">
	       <img class="sliderImg" src="/assets/img/Advanced Smart Software2.png" onclick="location.href='https://www.naver.com'">
	       <br>
	       스마트전기전자 EPL
	    </div>
	</div>
	
	
<script>
	 	$(function() {
	 		$('.marquee_text').marquee({
	 	    	speed: 60,//속도
	 	        direction: 'left',//방향
	 	        duration: 50000,
	 	        gap: 50,//간격
	 	        delayBeforeStart: 0,//시작 delay값
	 	        duplicated: true,//선택 영역 복제
	 	        startVisible: true,
	 	        pauseOnHover: true//hover시 일시중지
	 	    	
	 	    });
	 	});

</script>
 	
 	
</body>
</html>