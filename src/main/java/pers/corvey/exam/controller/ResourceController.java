package pers.corvey.exam.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pers.corvey.exam.controller.common.BaseControllerImpl;
import pers.corvey.exam.entity.Resource;
import pers.corvey.exam.entity.ui.CallBackMessage;
import pers.corvey.exam.exception.FileNotPermitException;
import pers.corvey.exam.service.BuyLogService;
import pers.corvey.exam.service.ResourceService;
import pers.corvey.exam.util.CurrentUtils;
import pers.corvey.exam.util.MyFileUtils;

@Controller
@RequestMapping("/resource")
public class ResourceController extends BaseControllerImpl<Resource, Long> {
	
	private final ResourceService service;
	private final BuyLogService buyLogService;
	
	@Autowired
	public ResourceController(ResourceService service, BuyLogService buyLogService) {
		super(service, "resource-input.jsp", "resource-list.jsp");
		this.service = service;
		this.buyLogService = buyLogService;
		needEntityURLSuffix.add("/download");
	}
	
	@PostMapping("/upload")
	public String upload(Model model, @ModelAttribute("entity") Resource entity,
			@RequestParam("file") MultipartFile multipartFile) {
		save(model, entity, multipartFile);
		return redirect("/all");
	}
	
	@PostMapping(SAVE_PATH)
	public String save(Model model, @ModelAttribute("entity") Resource entity,
			@RequestParam("file") MultipartFile multipartFile) {
		CallBackMessage msg;
		if (multipartFile.getSize() <= 0) {
			msg = CallBackMessage.createDangerMsg("必须上传文件！");
		} else {
			try {
				File file = MyFileUtils.saveFile(multipartFile);
				entity.setFileName(multipartFile.getOriginalFilename());
				entity.setFileSize(multipartFile.getSize());
				entity.setFilePath(file.getPath());
				return baseSave(entity);
			} catch (IOException e) {
				e.printStackTrace();
				msg = CallBackMessage.createDangerMsg("上传文件失败，服务器发生未知异常！");
			} catch (FileNotPermitException e) {
				msg = CallBackMessage.createDangerMsg(e.getMessage());
			}
		}
		CurrentUtils.addAttributeToSession(CallBackMessage.MESSAGE_ATTRIBUTE_NAME, msg);
		return redirect(LIST_PATH);
	}

	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(@ModelAttribute("entity") Resource entity) {
		if (entity == null || entity.getId() == null) {
			return null;
		}
		// 购买失败
		if (!buyLogService.buy(entity)) {
			return null;	// XXX 无法下载时返回的页面不够友好
		}
		try {
			File file = new File(entity.getFilePath());
			InputStream is = new FileInputStream(file);
			byte[] body = new byte[is.available()];
			is.read(body);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Disposition", "attchement;filename=" + file.getName());
			HttpStatus statusCode = HttpStatus.OK;
			ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(body, headers, statusCode);
			is.close();
			return ret;
		} catch (FileNotFoundException e) {
			CallBackMessage msg = CallBackMessage.createDangerMsg("服务器发生异常，请重试！");
			msg.addToCurrentSession();
			e.printStackTrace();
		} catch (IOException e) {
			CallBackMessage msg = CallBackMessage.createDangerMsg("服务器发生异常，请重试！");
			msg.addToCurrentSession();
			e.printStackTrace();
		}
		return null;	// XXX 无法下载时返回的页面不够友好
	}
	
	@RequestMapping("/all")
	public String all(Model model) {
		List<Resource> resources = service.findAll();
		model.addAttribute("entities", resources);
		return "resource-all";
	}
	
	@RequestMapping("/adminSearch")
	public String adminSearch(Model model, @RequestParam("keyword") String keyword) {
		return baseShowListView(model, service.search(keyword));
	}
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam("keyword") String keyword) {
		Iterable<Resource> resources = service.search(keyword);
		model.addAttribute("entities", resources);
		return "resource-all";
	}
	
	@RequestMapping("/{resourceId}")
	public String show(Model model, @PathVariable Long resourceId) {
		Resource resource = service.findByID(resourceId);
		model.addAttribute("resource", resource);
		
		boolean hadBought = buyLogService.hadBought(resource);
		model.addAttribute("hadBought", hadBought);
		System.out.println(hadBought);
		return "resource-show";
	}
}
