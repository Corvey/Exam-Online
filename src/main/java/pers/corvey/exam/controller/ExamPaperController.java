package pers.corvey.exam.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pers.corvey.exam.controller.common.BaseControllerImpl;
import pers.corvey.exam.entity.ExamPaper;
import pers.corvey.exam.entity.Question;
import pers.corvey.exam.entity.ui.CallBackMessage;
import pers.corvey.exam.service.ExamPaperService;
import pers.corvey.exam.util.ExcelToQuestionUtils;

@Controller
@RequestMapping("/exampaper")
public class ExamPaperController extends BaseControllerImpl<ExamPaper, Long> {

	private final ExamPaperService examPaperService;
	
	@Autowired
	public ExamPaperController(ExamPaperService examPaperService) {
		super(examPaperService, "exampaper-input.jsp", "exampaper-list.jsp");
		this.examPaperService = examPaperService;
	}
	
	@PostMapping(SAVE_PATH)
	public String save(Model model, @ModelAttribute("entity") ExamPaper examPaper, 
			@RequestParam("file") MultipartFile file) {
		CallBackMessage msg;
		try {
			InputStream inputStream = file.getInputStream();
			List<Question> questions = ExcelToQuestionUtils.readQuestions(inputStream);
			inputStream.close();
			examPaper.setQuestions(questions);
			return baseSave(examPaper);
		} catch (IOException e) {
			e.printStackTrace();
			msg = CallBackMessage.createDangerMsg("服务器异常，请重试！");
		} catch (EncryptedDocumentException e) {
			e.printStackTrace();
			msg = CallBackMessage.createDangerMsg("题目文档已被加密，无法识别！");
		} catch (InvalidFormatException e) {
			e.printStackTrace();
			msg = CallBackMessage.createDangerMsg("题目文档格式有误！");
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
			msg = CallBackMessage.createDangerMsg(e.getMessage());
		}
		msg.addToCurrentSession();
		return redirect(LIST_PATH);
	}
	
	@PostMapping("/search")
	public String search(Model model, @RequestParam("keyword") String keyword) {
		return baseShowListView(model, examPaperService.search(keyword));
	}
}
