package pers.corvey.exam.exception;

public class FileNotPermitException extends Exception {

	private static final long serialVersionUID = -1597286590998413678L;

	public FileNotPermitException() {
        super();
    }

    public FileNotPermitException(String message) {
        super(message);
    }

    public FileNotPermitException(String message, Throwable cause) {
        super(message, cause);
    }

    public FileNotPermitException(Throwable cause) {
        super(cause);
    }
}
