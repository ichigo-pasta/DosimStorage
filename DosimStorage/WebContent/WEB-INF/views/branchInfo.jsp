<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dcd1967942f030312f2789a036f32080"></script>
<style type="text/css">
@import url("common.css");
#menu_wrap {
	position: absolute;
	top: 0; left: 0; bottom: 0;
	width: 220px; margin: 10px 0 30px 10px; padding: 5px;
	height: 270px;
	overflow-y: hidden;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	font-size: 16px;
	border-radius: 10px;
}
.bg_white {background:#fff;}
.map_wrap {position:relative; width:100%; height:500px;}

.container ul {	
	margin: 20px 0
}
button {
	width: 200px;
	background: rgba(255, 255, 255, 0);
	border: none;
	border-bottom: solid 1px black;	
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #999;
	padding: 0; 5px;	
	text-align: left;	
}
.last_bt{ border: none}
.b_bt_t {
	font-size: 18px;
	font-weight: bold;
	padding: 10px 0 5px 0	
}
.b_bt_ad {color: #555; padding: 5px 0 10px 0}
.inner_container {
		margin: 0 auto;
		width: 960;		
	}
</style>
<script type="text/javascript">
	const b1_lat = 37.56271532, b1_long = 126.9768764;	// 광화문점 위도, 경도
	const b2_lat = 37.5199454, b2_long = 127.0256598;	// 신사점 위도, 경도
	const b3_lat = 37.390331, b3_long = 127.082675;		// 판교점 위도, 경도
	
	function setCenter(a, b, num) {
		var moveLatLon = new kakao.maps.LatLng(a, b);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	    branchDetail(num);
	}
	function branchDetail(num) {
		var xhr = new XMLHttpRequest();
		xhr.open('get', 'branchDetail.do?br='+num, true);
		xhr.onload = function() {
			if (xhr.status >= 200 && xhr.status < 400) {	// https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
				var dispLisp = xhr.responseText;

				document.getElementById('branch_info').innerHTML = dispLisp;
			}
		};
		xhr.send();
	}	
</script>
<c:if test="${br == 1}">
	<script type="text/javascript">		
		window.onpageshow = function() {
			setCenter(b1_lat, b1_long, 1);
		}
	</script>
</c:if>
<c:if test="${br == 2}">
	<script type="text/javascript">
		window.onpageshow = function() {
			setCenter(b2_lat, b2_long, 2);
		}
	</script>
</c:if>
<c:if test="${br == 3}">
	<script type="text/javascript">
		window.onpageshow = function() {
			setCenter(b3_lat, b3_long, 3);
		}
	</script>
</c:if>
</head>
<body>
<div class="container">
	<div class="inner_container">
		<div class="map_wrap">
			<div id="map" style="max-width: 1200px; height: 500px;"></div>
			<div id="menu_wrap" class="bg_white">
				<ul id="placesList">
					<li><button type="button" onclick="setCenter(b1_lat, b1_long, 1)">
							<p class="b_bt_t" id="b_bt_1">도심창고 광화문점</p>
							<p class="b_bt_ad">서울특별시 종로구 세종대로 11</p>					
					</button>
					</li>						
					<li>
						<button type="button" onclick="setCenter(b2_lat, b2_long, 2)">
							<p class="b_bt_t">도심창고 신사점</p>
							<p class="b_bt_ad">서울특별시 강남구 도산대로 25</p>
						</button>
					</li>
					<li>
						<button type="button" class="last_bt" onclick="setCenter(b3_lat, b3_long, 3)">
							<p class="b_bt_t">도심창고 판교점</p>
							<p class="b_bt_ad">경기도 성남시 분당구 판교로 37</p>
						</button>
					</li>
				</ul>
			</div>
		</div>
		<div id="branch_info"></div>
	</div>
</div>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(b1_lat, b1_long), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	// 마커 생성
	var marker1 = new kakao.maps.Marker({
	    map: map,
	    title: "광화문점",
	    position: new kakao.maps.LatLng(b1_lat, b1_long),
		clickable: true
	});
	var marker2 = new kakao.maps.Marker({
	    map: map,
	    title: "신사점",
	    position: new kakao.maps.LatLng(b2_lat, b2_long),
		clickable: true
	});
	var marker3 = new kakao.maps.Marker({
	    map: map,
	    title: "판교점",
	    position: new kakao.maps.LatLng(b3_lat, b3_long),
		clickable: true
	});
	// 인포윈도우 생성
	var infowindow1 = new kakao.maps.InfoWindow({
    	content: '<div style="width: 152px; text-align: center">도심창고 광화문점</div>'
	});
	infowindow1.open(map, marker1);	
	var infowindow2 = new kakao.maps.InfoWindow({
    	content: '<div style="width: 152px; text-align: center">도심창고 신사점</div>'
	});
	infowindow2.open(map, marker2);
	var infowindow3 = new kakao.maps.InfoWindow({
    	content: '<div style="width: 152px; text-align: center">도심창고 판교점</div>'
	});	
	infowindow3.open(map, marker3);	
	
	// 클릭이벤트
	kakao.maps.event.addListener(marker1, 'click', function() {
		branchDetail(1);
	});
	kakao.maps.event.addListener(marker2, 'click', function() {
		branchDetail(2);
	});
	kakao.maps.event.addListener(marker3, 'click', function() {
		branchDetail(3);
	});
</script>
</body>
</html>