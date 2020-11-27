<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--- 
    Ajax (Asynchronus Javascript & xml) : 자바스크립트를 이용한 백그라운드 비동기 통신 기술
	(하나의 웹페이지 안에서 변경사항이 발생한 특정 일부분에 대해서만 갱신이 가능해진다.)

	httpRequest.js -> ajax 사용을 위한 자바스크립트!

      -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- 외부 자바스크립트 참조
			참조된 자바스크립트를  가진 script내부에는 아무것도 넣을 수 없다.(집어 넣으면 오류..)  -->
		<script src="js/httpRequest.js"></script><!--자바스크립트 참조  -->
		
		<script type="text/javascript">
		function send() {
			var dan = document.getElementById("dan").value;
		
			if(dan < 2 || dan >9){
			alert("2~9사이의 값을 입력하세요");
			return;			
			}
			
			//Ajax를 통한 파라미터 전달
			var url = "gugudan_ajax.jsp";
			var param = "dan="+dan;
			
			//js폴더에 있는 httpRequest.js에 있는 메서드
			sendRequest(url, param, resultFn,"get");
			
			/* uri : 원하는 페이지
			   param : 보내고자하는 파라미터
			   ressultFn : 콜백 메서드(다시 돌아올 메서드)
				get : 전송 방식*/
				
				function resultFn() {
					//Ajax를 통해 호출된 페이지에서 작업을 완료한 후 자동으로 호출되는 콜백 메서드
					
					console.log(xhr.readyState + "/" + xhr.status);
					//xhr.readyState
					//0 : 초기화오류
					//1: 로딩 중
					//2: 로딩 중
					//3: 로딩 중
					//4: 로드완료
					
					//xhr.status
					//200 : 이상없음
					//404(경로없음), 500(서버에러) 등... : 이상있음.. 
					
					//즉, xhr.readyState가 4가 나오고, xhr.status가 200이 나오면 아무 이상없이
					//출력을 할 수 있다는 뜻..
					
					if(xhr.readyState == 4 && xhr.status == 200){
					//작업을 마친후 최종적으로 돌아오는 데이터
					var data = xhr.responseText;
					/*xhr : 넘어온 값.  */
					/* alert(data); */
					document.getElementById("disp").innerHTML = data;
					
					}				
			}
					
		}
		</script>
	</head>
	<body>
		단: <input id = "dan">
		<input  type = "button" value = "확인" onclick = "send();">
		
		<hr>
		
		<div id = "disp"></div>		
	</body>
</html>