package pers.corvey.exam.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/exception")
public class ExceptionController {

	@GetMapping("/403")
	public String show403Page() {
		return "exception/403";
	}
}
