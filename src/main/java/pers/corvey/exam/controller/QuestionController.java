package pers.corvey.exam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.corvey.exam.controller.common.BaseControllerImpl;
import pers.corvey.exam.entity.ExamPaper;
import pers.corvey.exam.entity.Question;
import pers.corvey.exam.helper.form.QuestionFormHelper;
import pers.corvey.exam.service.ExamPaperService;
import pers.corvey.exam.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController extends BaseControllerImpl<Question, Long> {

	private final QuestionService questionService;
	private final ExamPaperService examPaperService;
	
	@Autowired
	public QuestionController(QuestionService service, ExamPaperService examPaperService) {
		super(service, "question-input.jsp", "question-list.jsp");
		this.questionService = service;
		this.examPaperService = examPaperService;
	}

	@PostMapping(SAVE_PATH)
	public String save(Model model, 
			@ModelAttribute(ENTITY_ATTRIBUTE_NAME) Question question,
			QuestionFormHelper questionFormHelper) {
		//System.out.println(questionFormHelper);
		questionFormHelper.updateToQuestion(question);
		return baseSave(question);
	}
	
	@Override
	public String showInputView(Model model, 
			@ModelAttribute(ENTITY_ATTRIBUTE_NAME) Question entity) {
		
		Iterable<ExamPaper> exampapers = examPaperService.findAll();
		model.addAttribute("exampapers", exampapers);
		return super.showInputView(model, entity);
	}
	
	@Override
	public String showDetailView(Model model, 
			@ModelAttribute(ENTITY_ATTRIBUTE_NAME) Question entity) {
		
		Iterable<ExamPaper> exampapers = examPaperService.findAll();
		model.addAttribute("exampapers", exampapers);
		return super.showDetailView(model, entity);
	}
	
	@RequestMapping("/{questionId}")
	public String show(Model model, @PathVariable Long questionId) {
		Question question = questionService.findByID(questionId);
		model.addAttribute("question", question);
		return "question-show";
	}
}
