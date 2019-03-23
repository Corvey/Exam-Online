package pers.corvey.exam.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.util.Assert;

import pers.corvey.exam.entity.Choice;
import pers.corvey.exam.entity.Question;

public class ExcelToQuestionUtils {

	public static List<Question> readQuestions(File file) 
			throws EncryptedDocumentException, InvalidFormatException, IOException {
		
		Workbook workbook = WorkbookFactory.create(file);
		List<Question> questions = readQuestions(workbook.getSheetAt(0)); 
		workbook.close();
		return questions;
	}
	
	public static List<Question> readQuestions(InputStream inputStream) 
			throws EncryptedDocumentException, InvalidFormatException, IOException {
		
		Workbook workbook = WorkbookFactory.create(inputStream);
		List<Question> questions = readQuestions(workbook.getSheetAt(0)); 
		workbook.close();
		return questions;
	}
	
	private static List<Question> readQuestions(Sheet sheet) {
		Assert.notNull(sheet, "找不到相应的工作表！");
		List<Question> questions = new ArrayList<>(); 
		for (int i=0; i<sheet.getLastRowNum(); ) {
			Question question = readQuestion(sheet, i);
			if (question == null) {
				break;
			}
			questions.add(question);
			i += question.getChoices().size() + 3;
		}
		return questions;
	}
	
	private static Question readQuestion(Sheet sheet, int rowNum) {
		// 检测题干行
		Row questionContentRow = sheet.getRow(rowNum);
		if (questionContentRow == null) {
			return null;
		}
		Question question = new Question();
		
		// 读取题干
		Cell questionContentCell = questionContentRow.getCell(0);
		Assert.notNull(questionContentCell, 
				createErrorMsg(questionContentRow.getRowNum(), 'A', "题干不能为空！"));
		question.setContent(questionContentCell.getStringCellValue());
		
		// 检测题目信息行（类型、答案）
		Row questionInfoRow = sheet.getRow(rowNum+1);
		Assert.notNull(questionInfoRow, createErrorMsg(rowNum + 2, 'A', "题目信息不能为空！"));
		
		// 读取题目类型
		Cell questionTypeCell = questionInfoRow.getCell(0);
		Assert.notNull(questionTypeCell, 
				createErrorMsg(questionInfoRow.getRowNum()+1, 'A', "题目类型不能为空！"));
		question.setType(questionTypeCell.getStringCellValue());
		
		// 读取题目答案
		Cell questionAnswerCell = questionInfoRow.getCell(1);
		Assert.notNull(questionAnswerCell, 
				createErrorMsg(questionInfoRow.getRowNum()+1, 'B', "题目答案不能为空！"));
		String answerStr = questionAnswerCell.getStringCellValue();
		
		// 检测选项行
		Row firstChoiceRow = sheet.getRow(rowNum+2);
		Assert.notNull(firstChoiceRow, createErrorMsg(rowNum + 3, 'A', "题目选项不能为空！"));
		Assert.notNull(firstChoiceRow.getCell(0), 
				createErrorMsg(rowNum + 3, 'A', "题目选项不能为空！"));
		
		// 读取题目选项
		List<Choice> choices = new ArrayList<>();
		for (int i = rowNum+2; true; ++i) {
			Row choiceContentRow = sheet.getRow(i);
			if (choiceContentRow == null) {
				break;
			}
			Cell choiceContentCell = choiceContentRow.getCell(0);
			Assert.notNull(choiceContentCell, 
					createErrorMsg(choiceContentRow.getRowNum(), 'A', "题目选项不能为空！"));
			Choice choice = new Choice();
			choice.setContent(choiceContentCell.getStringCellValue());
			choice.setQuestion(question);
			choice.setAnswer(false);
			choices.add(choice);
		}
		
		// 解析题目答案
		for (char answerChar : answerStr.toCharArray()) {
			int answerIndex = answerChar - 'A';
			try {
				Choice choice = choices.get(answerIndex);
				choice.setAnswer(true);
			} catch (IndexOutOfBoundsException e) {
				String msg = createErrorMsg(questionInfoRow.getRowNum(), 'B', "答案有误！");
				msg += String.format("不存在选项%c！", answerChar);
				throw new IllegalArgumentException(msg);
			}
		}
		question.setChoices(choices);
		return question;
	}
	
	private static String createErrorMsg(int row, char col, String msg) {
		return String.format("表格中第%d行第%c列的%s", row, col, msg);
	}
	
	public static void main(String[] args) throws EncryptedDocumentException, InvalidFormatException, IOException {
		File file = new File("e://test.xls");
		List<Question> questions = readQuestions(file);
		questions.forEach(q -> {
			System.out.println(q);
		});
	}
}
