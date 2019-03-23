package pers.corvey.exam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.corvey.exam.entity.Resource;
import pers.corvey.exam.entity.ResourceComment;
import pers.corvey.exam.entity.sys.SysUser;
import pers.corvey.exam.entity.ui.CallBackMessage;
import pers.corvey.exam.service.ResourceCommentService;
import pers.corvey.exam.service.ResourceService;
import pers.corvey.exam.util.CurrentUtils;

@Controller
@RequestMapping("/resourceComment")
public class ResourceCommentController {

	private final ResourceCommentService service;
	private final ResourceService resourceService;
	
	@Autowired
	public ResourceCommentController(ResourceCommentService service, 
			ResourceService resourceService) {
		this.service = service;
		this.resourceService = resourceService;
	}
	
	@RequestMapping("/good")
	@ResponseBody
	public int thumbsUp(@RequestParam("id") Long commentId) {
		return service.thumbsUp(commentId);
	}
	
	@PostMapping("/save")
	public String save(ResourceComment entity, 
			@RequestParam("resourceId") Long resourceId) {
		SysUser user = CurrentUtils.getCurrentUser();
		Resource Resource = resourceService.findByID(resourceId);
		entity.setUser(user);
		entity.setResource(Resource);
		CallBackMessage msg = CallBackMessage.createMsgAfterFunction(
				() -> service.save(entity), "回复成功！", "回复失败！请重试！");
		msg.addToCurrentSession();
		return "redirect:/resource/" + resourceId;
	}
	
}
