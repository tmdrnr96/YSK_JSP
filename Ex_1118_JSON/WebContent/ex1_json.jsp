<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--JSON(JavaScript Object Notation) 표기법 :  
    	서로 다른 OS나 프로그램에서 데이터를 교환하기 위한 약속된 표기방식
    	어떤 OS에도 구애받지 않고 어디서든 호출하던 똑같은 결과값을 받게해주는 표기법
    	(어떤언어든 표기법은 똑같음..(플렛폼(OS)이 달라도 공통된 데이터 타입을 얻을 수 있다.))-->
    	
    <!-- 제이슨을 통해 서로 다른 플랫폼에서도 공통된 데이터 타입을 제공받을 수 있다.  -->
    	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		
		//일반 JSON타입
		var p = {'name':'홍길동','age':30,'tel':'010-111-1111'};
		document.write("이름 : " + p.name + "<br>");
		document.write("나이 : " + p['age'] + "<br>");
		document.write("전화 : " + p.tel + "<br>");
		
		//JSON의 배열
		var sido = [{'name':'일길동', 'age':25},
					{'name':'호부호형', 'age':250}, 
					{'name':'독고길동', 'age':50}];
		
		document.write(sido[2].name + "/" + sido[2].age + "<br>");
		document.write(sido[0].name + "/" + sido[0].age + "<br>");
		
		//JSON 복합
		var course = {'name' : '웹개발3',
					  'start' : '2020-08-17',
					  'end' : '2020-02-02',
					  'sub':['java', 'jsp','android'],
					  'student' : [{'name':'hong', 'age':20 },
									 {'name':'kim', 'age':25},
									 {'name':'lee', 'age':22}]};
		
		document.write("과목명 : " + course.name + "<br>");
		document.write("사작일 : " + course.start + "<br>");
		document.write("종료일 : " + course.end + "<br>");
		document.write("세부과목1 : " + course.sub[0] + "<br>");
		document.write("세부과목2 : " + course.sub[1] + "<br>");
		document.write("세부과목3 : " + course.sub[2] + "<br>");
		
		document.write("학생 1: " + course.student[0].name + "/" +course.student[0].age + "<br>");
		document.write("학생 2: " + course.student[1].name + "/" +course.student[1].age + "<br>");
		document.write("학생 3: " + course.student[2].name + "/" +course.student[2].age + "<br>");
		
		
		</script>
	</head>
	<body>
	
	</body>
</html>