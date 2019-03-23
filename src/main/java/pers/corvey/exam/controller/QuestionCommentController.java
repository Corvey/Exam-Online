package pers.corvey.exam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.corvey.exam.entity.Question;
import pers.corvey.exam.entity.QuestionComment;
import pers.corvey.exam.entity.sys.SysUser;
import pers.corvey.exam.entity.ui.CallBackMessage;
import pers.corvey.exam.service.QuestionCommentService;
import pers.corvey.exam.service.QuestionService;
import pers.corvey.exam.util.CurrentUtils;

@Controller
@RequestMapping("/questionComment")
public class QuestionCommentController {

	private final QuestionCommentService service;
	private final QuestionService questionService;
	
	@Autowired
	public QuestionCommentController(QuestionCommentService service, 
			QuestionService questionService) {
		this.service = service;
		this.questionService = questionService;
	}
	
	@RequestMapping("/good")
	@ResponseBody
	public int thumbsUp(@RequestParam("id") Long commentId) {
		return service.thumbsUp(commentId);
	}
	
	@PostMapping("/save")
	public String save(QuestionComment entity, 
			@RequestParam("questionId") Long questionId) {
		SysUser user = CurrentUtils.getCurrentUser();
		Question question = questionService.findByID(questionId);
		entity.setUser(user);
		entity.setQuestion(question);
		CallBackMessage msg = CallBackMessage.createMsgAfterFunction(
				() -> service.save(entity), "回复成功！", "回复失败！请重试！");
		msg.addToCurrentSession();
		return "redirect:/question/" + questionId;
	}
}
