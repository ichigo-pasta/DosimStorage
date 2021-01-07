	var xhr, xhr1, xhr2;	// XMLHttpRequest 생성에 쓸 변수
	
	window.onload = function() {
		xhr2 = new XMLHttpRequest();
		xhr2.open("get","stockCheck.do",true);	// 매진여부 체크
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4) {	// readyState : 0-XMLHttpRequest객채생성, 1-open메소드 실행, 2-요청 응답 도착 3-요청데이터 처리중 4-응답준비완료
				if (xhr2.status == 200) {	// status : https://developer.mozilla.org/en-US/docs/Web/HTTP/Status 참고
					document.getElementById('soldout').value = xhr2.responseText;
				} else {
					alert('요청오류: '+xhr2.status);
				}				
			}
		}		
		xhr2.send(null);
	}	
	
	function select_branch(b_code) {
		switch(b_code) {
		case 1:	// 광화문점을 선택했을 때
			document.getElementById('select_1').checked = true;							// 광화문점 라디오버튼 체크
			if (document.getElementById('soldout').value.includes("small"+b_code)) {// 광화문 s창고 매진이면
				document.getElementById('select_small').disabled = true;				// s창고 라디오버튼 사용불가
				document.getElementById('select_small').checked = false;				// s창고 라디오버튼 체크해제
				document.getElementById('st_button1').src = "images/ss1.png";			// s창고 버튼 매진표시
			} else {																// 광화문 s창고 매진아니면
				document.getElementById('select_small').disabled = false;				// s창고 라디오버튼 사용가능
				document.getElementById('st_button1').src = "images/s1.png";			// s창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("medium"+b_code)) {// 광화문 m창고 매진이면
				document.getElementById('select_medium').disabled = true;				// m창고 라디오버튼 사용불가
				document.getElementById('select_medium').checked = false;				// m창고 라디오버튼 체크해제
				document.getElementById('st_button2').src = "images/ss2.png";			// m창고 버튼 매진표시
			} else {																// 광화문 m창고 매진아니면
				document.getElementById('select_medium').disabled = false;				// m창고 라디오버튼 사용가능		
				document.getElementById('st_button2').src = "images/s2.png";			// m창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("large"+b_code)) {// 광화문 l창고 매진이면
				document.getElementById('select_large').disabled = true;				// l창고 라디오버튼 사용불가
				document.getElementById('select_large').checked = false;				// l창고 라디오버튼 체크해제
				document.getElementById('st_button3').src = "images/ss3.png";			// l창고 버튼 매진표시
			} else {																// 광화문 l창고 매진아니면
				document.getElementById('select_large').disabled = false;				// l창고 라디오버튼 사용가능
				document.getElementById('st_button3').src = "images/s3.png";			// l창고 정상버튼 표시
			}
			period();
			break;
		case 2:	// 신사점을 선택했을 때
			document.getElementById('select_2').checked = true;							// 신사점 라디오버튼 체크
			if (document.getElementById('soldout').value.includes("small"+b_code)) {// 신사 s창고 매진이면
				document.getElementById('select_small').disabled = true;				// s창고 라디오버튼 사용불가
				document.getElementById('select_small').checked = false;				// s창고 라디오버튼 체크해제
				document.getElementById('st_button1').src = "images/ss1.png";			// s창고 버튼 매진표시
			} else {																// 신사 s창고 매진아니면
				document.getElementById('select_small').disabled = false;				// s창고 라디오버튼 사용가능
				document.getElementById('st_button1').src = "images/s1.png";			// s창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("medium"+b_code)) {// 신사 m창고 매진이면
				document.getElementById('select_medium').disabled = true;				// m창고 라디오버튼 사용불가
				document.getElementById('select_medium').checked = false;				// m창고 라디오버튼 체크해제
				document.getElementById('st_button2').src = "images/ss2.png";			// m창고 버튼 매진표시
			} else {																// 신사 m창고 매진아니면
				document.getElementById('select_medium').disabled = false;				// m창고 라디오버튼 사용가능		
				document.getElementById('st_button2').src = "images/s2.png";			// m창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("large"+b_code)) {// 신사 l창고 매진이면
				document.getElementById('select_large').disabled = true;				// l창고 라디오버튼 사용불가
				document.getElementById('select_large').checked = false;				// l창고 라디오버튼 체크해제
				document.getElementById('st_button3').src = "images/ss3.png";			// l창고 버튼 매진표시
			} else {																// 신사 l창고 매진아니면
				document.getElementById('select_large').disabled = false;				// l창고 라디오버튼 사용가능
				document.getElementById('st_button3').src = "images/s3.png";			// l창고 정상버튼 표시
			}
			period();
			break;
		case 3:	// 판교점을 선택했을 때
			document.getElementById('select_3').checked = true;							// 판교점 라디오버튼 체크
			if (document.getElementById('soldout').value.includes("small"+b_code)) {// 판교 s창고 매진이면
				document.getElementById('select_small').disabled = true;				// s창고 라디오버튼 사용불가
				document.getElementById('select_small').checked = false;				// s창고 라디오버튼 체크해제
				document.getElementById('st_button1').src = "images/ss1.png";			// s창고 버튼 매진표시
			} else {																// 판교 s창고 매진아니면
				document.getElementById('select_small').disabled = false;				// s창고 라디오버튼 사용가능
				document.getElementById('st_button1').src = "images/s1.png";			// s창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("medium"+b_code)) {// 판교 m창고 매진이면
				document.getElementById('select_medium').disabled = true;				// m창고 라디오버튼 사용불가
				document.getElementById('select_medium').checked = false;				// m창고 라디오버튼 체크해제
				document.getElementById('st_button2').src = "images/ss2.png";			// m창고 버튼 매진표시
			} else {																// 판교 m창고 매진아니면
				document.getElementById('select_medium').disabled = false;				// m창고 라디오버튼 사용가능		
				document.getElementById('st_button2').src = "images/s2.png";			// m창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("large"+b_code)) {// 판교 l창고 매진이면
				document.getElementById('select_large').disabled = true;				// l창고 라디오버튼 사용불가
				document.getElementById('select_large').checked = false;				// l창고 라디오버튼 체크해제
				document.getElementById('st_button3').src = "images/ss3.png";			// l창고 버튼 매진표시
			} else {																// 판교 l창고 매진아니면
				document.getElementById('select_large').disabled = false;				// l창고 라디오버튼 사용가능
				document.getElementById('st_button3').src = "images/s3.png";			// l창고 정상버튼 표시
			}
			period();
		}		
	}
	function select_storage(s_kind) {
		switch(s_kind) {
		case 'small':	// s창고 선택했을 때
			if (document.getElementById('select_small').disabled == false) {	// 해당 지점 s창고 매진아니면
			document.getElementById('select_small').checked = true;				// 라디오버튼 체크
			}
			period();
			sel_reset();
			break;
		case 'medium':	// m창고 선택했을 때
			if (document.getElementById('select_medium').disabled == false) {	// 해당 지점 m창고 매진아니면
				document.getElementById('select_medium').checked = true;		// 라디오버튼 체크		
				}
			period();
			sel_reset();
			break;
		case 'large':	// l창고 선택했을 때
			if (document.getElementById('select_large').disabled == false) {	// 해당 지점 l창고 매진아니면
				document.getElementById('select_large').checked = true;			// 라디오버튼 체크	
				}
			period();
			sel_reset();
		}		
	}
	function period() {	// 지점, 창고 둘 다 선택됐을 경우만 기간선택창 활성화시키는 함수
				// 지점 하나가 선택되어 있고
		if (document.getElementById('select_1').checked || document.getElementById('select_2').checked || document.getElementById('select_3').checked) {
				// 창고타입도 선택했을 경우
			if (document.getElementById('select_small').checked || document.getElementById('select_medium').checked || document.getElementById('select_large').checked) {
				order_form.period.disabled = false;	// 기간선택 이용가능하게 변경
			} else {	// 아닌 경우 이용불가처리 및 select 초기화
				order_form.period.disabled = true;
				document.getElementById('peri_novalue').selected = true;
			}
		} else {		// 아닌 경우 이용불가처리 및 select 초기화
			order_form.period.disabled = true;
			document.getElementById('peri_novalue').selected = true;		
		}
	}
	// 은행 선택하면 db에서 계좌와 예금주 이름 조회해 표시하는 함수
	function get_account(bank) {
		xhr = new XMLHttpRequest();
		xhr.open("post","bank.do",true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {	// readyState : 0-XMLHttpRequest객채생성, 1-open메소드 실행, 2-요청 응답 도착 3-요청데이터 처리중 4-응답준비완료
				if (xhr.status == 200) {	// status : https://developer.mozilla.org/en-US/docs/Web/HTTP/Status 참고
					document.getElementById('account_no').value = xhr.responseText;
				} else {
					alert('요청오류: '+xhr.status);
				}				
			}
		}
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send("bank="+order_form.bank.value);
		
		xhr1 = new XMLHttpRequest();
		xhr1.open("post","bank1.do",true);
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4) {	// readyState : 0-XMLHttpRequest객채생성, 1-open메소드 실행, 2-요청 응답 도착 3-요청데이터 처리중 4-응답준비완료
				if (xhr1.status == 200) {	// status : https://developer.mozilla.org/en-US/docs/Web/HTTP/Status 참고
					document.getElementById('account_name').value = xhr1.responseText;
				} else {
					alert('요청오류: '+xhr1.status);
				}				
			}
		}
		xhr1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr1.send("bank="+order_form.bank.value);
	}
	function total_price(period) {
		
		if (period == null) {
			period = 0;
		}		
		var st = document.querySelector('input[name="storage"]:checked').value;
		xhr2 = new XMLHttpRequest();
		xhr2.open("get","priceCheck.do?storage=" + st + "&period=" + period, true);
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4) {	// readyState : 0-XMLHttpRequest객채생성, 1-open메소드 실행, 2-요청 응답 도착 3-요청데이터 처리중 4-응답준비완료
				if (xhr2.status == 200) {	// status : https://developer.mozilla.org/en-US/docs/Web/HTTP/Status 참고
					document.getElementById('tot_price').value = xhr2.responseText;
					comma(document.getElementById('tot_price').value);
				} else {
					alert('요청오류: '+xhr2.status);
				}				
			}
		}
		xhr2.send(null);		
	}
	function sel_reset() {	// 창고타입 선택을 바꾸면 가격표시 리셋하는 함수
		document.getElementById('peri_novalue').selected = true;
	}
	function comma(num) {	// 토탈 금액 콤마 붙여 표시하는 함수
		var rev_num = num.split("").reverse();	// 받은 데이터를 한 글자씩 배열에 담고 뒤집는다		
		var withCommas = [];	// 콤마 찍어 저장할 배열 선언
		for (var i=1; i <= rev_num.length; i++) {	// 뒤집은 배열 앞에서부터 하나씩
			withCommas.push(rev_num[i-1]);	// 저장할 배열에 담고
			if (i%3==0 && i != rev_num.length) {	// 3개 저장할때마다, 그리고 마지막 숫자가 아닐 때 콤마를 찍는다
				withCommas.push(',');
			}
		}	
		document.getElementById('tot_comma').value = withCommas.reverse().join("")+"원";	// '원'을 붙여 값 입력
	}