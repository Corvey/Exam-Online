package pers.corvey.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.corvey.exam.controller.common.BaseControllerImpl;
import pers.corvey.exam.entity.ChooseLog;
import pers.corvey.exam.entity.Exam;
import pers.corvey.exam.entity.ExamPaper;
import pers.corvey.exam.entity.ExamResult;
import pers.corvey.exam.helper.form.ChooseFormHelper;
import pers.corvey.exam.service.ChooseLogService;
import pers.corvey.exam.service.ExamPaperService;
import pers.corvey.exam.service.ExamResultService;
import pers.corvey.exam.service.ExamService;
import pers.corvey.exam.util.CurrentUtils;

@Controller
@RequestMapping("/exam")
public class ExamController extends BaseControllerImpl<Exam, Long> {

	private final ExamService service;
	private final ExamPaperService exampaperService; 
	private final ChooseLogService chooseLogService;
	private final ExamResultService examResultService;
	
	@Autowired
	public ExamController(ExamService service, ExamPaperService exampaperService,
			ChooseLogService chooseLogService, ExamResultService examResultService) {
		super(service, "exam-input.jsp", "exam-list.jsp");
		this.service = service;
		this.exampaperService = exampaperService;
		this.chooseLogService = chooseLogService;
		this.examResultService = examResultService;
		needEntityURLSuffix.add("/start");
	}
	
	@PostMapping(SAVE_PATH)
	public String save(Model model, @RequestParam("exampaperId") Long exampaperId,
			@ModelAttribute(ENTITY_ATTRIBUTE_NAME) Exam entity) {
		ExamPaper examPaper = exampaperService.findByID(exampaperId);
		entity.setExampaper(examPaper);
		return baseSave(entity);
	}
	
	@Override
	public String showInputView(Model model, 
			@ModelAttribute(ENTITY_ATTRIBUTE_NAME) Exam entity) {
		
		Iterable<ExamPaper> exampapers = exampaperService.findAll();
		model.addAttribute("exampapers", exampapers);
		return super.showInputView(model, entity);
	}
	
	@Override
	public String showDetailView(Model model, 
			@ModelAttribute(ENTITY_ATTRIBUTE_NAME) Exam entity) {
		
		Iterable<ExamPaper> exampapers = exampaperService.findAll();
		model.addAttribute("exampapers", exampapers);
		return super.showDetailView(model, entity);
	}
	
	@RequestMapping("/start")
	public String startExam(Model model) {
		return "exam";
	}
	
	@RequestMapping("/handin")
	public String handIn(ChooseFormHelper form) {
		List<ChooseLog> chooseLogs = form.generateChooseLog();
		chooseLogService.saveAll(chooseLogs);
		examResultService.chooseToExamResult(chooseLogs);
		return redirect("/result?id=" + form.getExamId());
	}
	
	@RequestMapping("/result")
	public String result(Model model, @RequestParam("id") Long examId) {
		Long userId = CurrentUtils.getCurrentUser().getId();
		List<ChooseLog> logs = chooseLogService.findByExamIdAndUserId(examId, userId);
		model.addAttribute("entities", logs);
		ExamResult result = examResultService.findByExamIdAndUserId(examId, userId);
		model.addAttribute("examResult", result);
		return "exam-result";
	}
	
	@RequestMapping("/show")
	public String show(Model model) {
		List<Exam> exams = service.findAll();
		model.addAttribute("entities", exams);
		return "exam-show";
	}
	
	@PostMapping("/adminSearch")
	public String adminSearch(Model model, @RequestParam("keyword") String keyword) {
		return baseShowListView(model, service.search(keyword));
	}
	
	@PostMapping("/search")
	public String search(Model model, @RequestParam("keyword") String keyword) {
		Iterable<Exam> exams = service.search(keyword);
		model.addAttribute("entities", exams);
		return "exam-show";
	}
	
	@RequestMapping("/wrong/hide")
	@ResponseBody
	public boolean hideWrong(@RequestParam("id") Long chooseLogId) {
		try {
			chooseLogService.hideChooseLog(chooseLogId);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@RequestMapping("/wrong/show")
	public String showWrong(Model model) {
		Long userId = CurrentUtils.getCurrentUser().getId();
		List<ChooseLog> logs = chooseLogService.getUserWrong(userId);
		model.addAttribute("entities", logs);
		return "wrong-question-show";
	}
}
