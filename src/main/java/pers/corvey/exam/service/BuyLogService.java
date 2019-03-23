package pers.corvey.exam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.corvey.exam.dao.BuyLogDAO;
import pers.corvey.exam.dao.ResourceDAO;
import pers.corvey.exam.dao.SysUserDAO;
import pers.corvey.exam.entity.BuyLog;
import pers.corvey.exam.entity.Resource;
import pers.corvey.exam.entity.sys.SysUser;
import pers.corvey.exam.entity.ui.CallBackMessage;
import pers.corvey.exam.service.common.BaseServiceImpl;
import pers.corvey.exam.util.CurrentUtils;

@Service
public class BuyLogService extends BaseServiceImpl<BuyLog, Long> {

	private final BuyLogDAO dao;
	private final ResourceDAO resourceDAO;
	private final SysUserDAO userDAO;
	
	@Autowired
	public BuyLogService(BuyLogDAO dao, ResourceDAO resourceDAO, SysUserDAO userDAO) {
		super(dao);
		this.dao = dao;
		this.resourceDAO = resourceDAO;
		this.userDAO = userDAO;
	}

	public boolean hadBought(Resource resource) {
		SysUser user = CurrentUtils.getCurrentUser();
		return resource.getSysModifyLog().getCreator().getId().equals(user.getId())
				|| dao.findByUserIdAndResourceId(user.getId(), resource.getId()) != null;
	}
	
	public boolean buy(Resource resource) {
		// 是否已购买
		if (hadBought(resource)) {
			return true;
		}
		
		SysUser buyer = CurrentUtils.getCurrentUser();
		int buyerMoney = buyer.getMoney();
		int resourcePrice = resource.getPrice();
		
		// 检查买家够不够积分
		if (buyerMoney < resourcePrice) {
			CallBackMessage msg = CallBackMessage.createDangerMsg("您的积分不足！无法下载！");
			CurrentUtils.addAttributeToSession(CallBackMessage.MESSAGE_ATTRIBUTE_NAME, msg);
			return false;
		}
		
		// 买家扣取相应积分
		buyer.setMoney(buyerMoney - resourcePrice);
		userDAO.save(buyer);
		
		// 卖家增加相应积分
		SysUser seller = resource.getSysModifyLog().getCreator();
		seller.setMoney(seller.getMoney() + resourcePrice);
		userDAO.save(seller);
		
		// 资源增加下载次数
		resource.setDownloadTimes(resource.getDownloadTimes() + 1);
		resourceDAO.save(resource);
		
		// 购买记录
		BuyLog log = new BuyLog();
		log.setUser(buyer);
		log.setResource(resource);
		log.setSpending(resourcePrice);
		dao.save(log);
		
		CallBackMessage msg = CallBackMessage.createSuccessMsg("下载成功！已扣除相应积分！");
		CurrentUtils.addAttributeToSession(CallBackMessage.MESSAGE_ATTRIBUTE_NAME, msg);
		return true;
	}
}
