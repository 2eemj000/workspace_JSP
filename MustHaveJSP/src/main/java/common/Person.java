package common; // 기본패키지 이외의 패키지 (자바빈즈 #1) -- src>main>java에는 X, common을 만들었음

public class Person { // DTO(데이터 전송 객체)
	private String name; // private 멤버 변수 (자바빈즈 #2) --> getter, setter있어야함 (자바빈즈 #4) & 접근지정자는 public (자바빈즈 #5)
	private int age;
	
	public Person() {} // 기본생성자가 있어야함 (자바빈즈 #3)
	
	// 오른쪽마우스>source>generate fields/getter/setter
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
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
}
