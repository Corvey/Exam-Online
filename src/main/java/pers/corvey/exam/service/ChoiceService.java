package pers.corvey.exam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.corvey.exam.dao.ChoiceDAO;
import pers.corvey.exam.entity.Choice;
import pers.corvey.exam.service.common.BaseServiceImpl;

@Service
public class ChoiceService extends BaseServiceImpl<Choice, Long> {

	private final ChoiceDAO choiceDAO;
	
	@Autowired
	public ChoiceService(ChoiceDAO choiceDAO) {
		super(choiceDAO);
		this.choiceDAO = choiceDAO;
	}

}
