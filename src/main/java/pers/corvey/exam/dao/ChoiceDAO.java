package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.Choice;

public interface ChoiceDAO extends CrudRepository<Choice, Long> {

}
