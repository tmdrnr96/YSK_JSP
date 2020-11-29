<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!--ajax를 쓰기 위한 준비!  -->
		<script type="text/javascript" src="js/httpRequest.js"></script>
	
		<script type="text/javascript">
		
		//웹브라우저 로드시 가장 먼저 호출되는 메서드 영역
		//이름이 없는 익명의 메서드
		window.onload = function() {
				var url = "movie_list.jsp";				
		/*넘길 파라미터가 없다면 null로 표시한다.  */
				sendRequest(url, null, result, "get");
		}
		
		//Ajax에 요청결과를 마치고 자동으로 호출되는 콜백메서드
		function result() {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				//요청한 페이지로부터 돌아온 데이터
				var data =xhr.responseText; 
				
				/* alert(data); 넘어온 data는 실제 json형태로 넘어오는 것이 아니기 때문에 진짜 json 형식으로 바꿔줘야한다. */			
			var json = eval(data);// 진짜 JSON 형식으로 바꿔주는 메서드!
	
			//<select>태그에 <option>태그 추가하기
			var movie_select = document.getElementById("movie_select");
			for(var i = 0; i < json.length; i++){
				var opt = document.createElement("option");//option이라는 태그를 만든다.(createElement 요소를 만든다.)
				
				//<option>타이틀</option> 아래 코드와 같다.
				opt.innerHTML = json[i].title;

				//<option value = "영상경로"></option>
				opt.value = json[i].path;
				
				//만들어진 option태그를 select태그에 추가
				movie_select.appendChild(opt); //자식(opt)을 추가한다.
				}
			}
		}
				function play() {
					
					//현재 선택된 value값을 얻어온다.
					var path = document.getElementById("movie_select").value; //option의 path경로!
					var my_video = document.getElementById("my_video");
					my_video.src = path;
					my_video.play();//자동재생
				}
			
		
		</script>
	
	</head>	
	<body>
		영상목록 : <!-- onchange="play(); select안에 있는 내용이 바뀌면.. play()를 호출한다.  -->
		<select id = "movie_select" onchange="play();">
			<option>:::재생할 영상을 선택하십시오:::</option>
		</select>	

		<hr>

	<!--src 어떤 영상을 보여 줄지에 대한 경로  -->
	<video src="" id = "my_video" width = "320" height ="240" controls="controls">
	
		
	
	</video>		
		
	</body>
</html>