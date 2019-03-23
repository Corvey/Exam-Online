package pers.corvey.exam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.corvey.exam.dao.ResourceCommentDAO;
import pers.corvey.exam.dao.SysUserDAO;
import pers.corvey.exam.entity.ResourceComment;
import pers.corvey.exam.entity.sys.SysUser;
import pers.corvey.exam.service.common.BaseServiceImpl;
import pers.corvey.exam.util.CurrentUtils;

@Service
public class ResourceCommentService extends BaseServiceImpl<ResourceComment, Long> {

	private final ResourceCommentDAO dao;
	private final SysUserDAO userDAO;
	
	@Autowired
	public ResourceCommentService(ResourceCommentDAO dao, SysUserDAO userDAO) {
		super(dao);
		this.dao = dao;
		this.userDAO = userDAO;
	}
	
	public int thumbsUp(Long id) {
		ResourceComment comment = dao.findOne(id);
		SysUser nowUser = CurrentUtils.getCurrentUser();
		SysUser commentUser = comment.getUser();
		if (nowUser.getId() != commentUser.getId()) {
			comment.setGood(comment.getGood() + 1);
			dao.save(comment);
			commentUser.setMoney(commentUser.getMoney() + 1);
			userDAO.save(commentUser);
		}
		return comment.getGood();
	}

}
