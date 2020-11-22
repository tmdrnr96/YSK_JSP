package vo;

public class PersonVO {
	//VO(ValueObject) : DB에서 넘어온 여러개의 정보를 하나로 묶어서 관리하기 위한 클래스
	
	private String name;
	private int age; 
	private String tel;
	
	//생성자를 생성 시에 파라미터값을 하나라도 넣지 않으면 만들어지지 않는다.
	public PersonVO(String name, int age, String tel) {
		this.name = name;
		this.age = age;
		this.tel = tel;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
