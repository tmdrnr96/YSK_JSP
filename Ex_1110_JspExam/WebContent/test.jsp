<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	//jsp : 내부적으로 연산능력을 가지는  html이라고 생각하면 된다.
	//jsp의 작업이 완료되어 컴파일이 수행되면 서블릿으로 자동변환된 후 결과가 출력된다.
	//그러므로 서블릿만으로는 한계가 있는 UI디자인을 쉽고 간편하게 만들 수 있다.
	
	//스크립트릿(scriptlet) : jsp에서 자바코드를 사용하고자 할 때 지정하는 영역
	//서블릿이 기존에 가지고 있던 request, response을 jsp에서 사용할 수 있다.
	//지역변수 개념
	String ip = request.getRemoteAddr();
	System.out.println(ip);
	
	String greet = "안녕하세요";
	
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	<body>
		<p>
			&lt;%@ 내용 %&gt;
			: jsp헤더 - import, 페이지 인코딩, 전송시 문자 타입등을 설정하는 영역
		</p>
		
		<p>
			&lt;% 자바코드 %&gt;
			: 스크립트 릿 - jsp에서 자바코드를 사용하고자 할 때 지정하는 영역
		</p>
		<p>
			&lt;%= 변수명 %&gt;
			: 스크립트 릿의 출력코드 - 스크립트 릿에서 만들어둔 변수를 출력하는 코드 영역
		</p>
		<p>
			&lt;%= 변수명; &gt; 과 같이 변수출력 코드에 ; 을 추가할 수 없다.
		</p>
		
		<!-- <%=ip%>의 출력 코드  -->
		<%=ip%><br>
		<%=greet %><br>
	</body>
</html>