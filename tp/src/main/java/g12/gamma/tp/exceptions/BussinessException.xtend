package g12.gamma.tp.exceptions

import java.lang.RuntimeException

class BusinessException extends RuntimeException {
	new(String msg) {
		super(msg)
	}
}