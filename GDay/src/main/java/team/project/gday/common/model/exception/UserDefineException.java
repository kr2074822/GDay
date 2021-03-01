package team.project.gday.common.model.exception;

public class UserDefineException extends RuntimeException {
	//runtimeException은 예외처리를 꼭 하지 않아도 되는
	//unchecked Exception의 최상위 부모이다
	
	//이를 상속받은 자식들은 모두 Unchecked Exception이 된다
	public UserDefineException() {
		super();
	}
	
	public UserDefineException(String message) {
		super(message);
	}
}
