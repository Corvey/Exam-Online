package pers.corvey.exam.service.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import pers.corvey.exam.entity.common.BaseEntity;

public interface BaseService<T extends BaseEntity<ID>, ID extends Serializable> {

	T createEntity();
	T save(T entity);
	
	T findByID(ID id);
	Iterable<T> findAll();
	Iterable<T> findAll(Iterable<ID> ids);
	void delete(ID id);
	
	default void delete(Iterable<ID> ids) {
		ids.forEach(this::delete);
	}
	
	default Iterable<T> saveAll(Iterable<T> entities) {
		List<T> ret = new ArrayList<>();
		entities.forEach(e -> {
			ret.add(save(e));
		});
		return ret;
	}
	
	/**
	 * 将iterable类型的对象转换为list类型的对象
	 * @param entities
	 * @return
	 */
	static <T> List<T> iterableTolist(Iterable<T> entities) {
		if (entities instanceof List) {
			return (List<T>) entities;
		}
		List<T> list = new ArrayList<>();
		if (entities != null) {
			entities.forEach(e -> list.add(e));
		}
		return list;
	}
}
