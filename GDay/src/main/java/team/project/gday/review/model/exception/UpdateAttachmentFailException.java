package team.project.gday.review.model.exception;

public class UpdateAttachmentFailException extends RuntimeException {
	//RuntimeException은 예외처리를 꼭 하지 않아도 되는 unchecked Exception의 최상위 부모
	// == try-catch/throws를 하지 않아도 예외가 발생 안 함
	// → 상속 받은 자식도 unchecked Exception이 됨
	
	public UpdateAttachmentFailException() {
		super();
	}
	public UpdateAttachmentFailException(String message) {
		super(message);
	}
}
