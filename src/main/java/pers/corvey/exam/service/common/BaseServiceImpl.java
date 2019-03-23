package pers.corvey.exam.service.common;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import pers.corvey.exam.entity.common.BaseEntity;

@Transactional
public abstract class BaseServiceImpl<T extends BaseEntity<ID>, ID extends Serializable> 
	implements BaseService<T, ID> {

	protected final CrudRepository<T, ID> mainDAO;
	private final Class<T> entityClazz;
	
	/**
	 * 为父类注入mainDAO
	 * @param mainDAO 该service主要用到的dao实例
	 */
	public BaseServiceImpl(CrudRepository<T, ID> mainDAO) {
		this.mainDAO = mainDAO;
		entityClazz = getEntityClass();
	}
	
	@Override
	public T save(T entity) {
		Assert.notNull(entity, "传入的实体不能为空！");
		entity.updateSysModifyLog();
		return mainDAO.save(entity);
	}
	
	@Override
	public T findByID(ID id) {
		return mainDAO.findOne(id);
	}
	
	@Override
	public List<T> findAll() {
		return BaseService.iterableTolist(mainDAO.findAll());
	}
	
	@Override
	public List<T> findAll(Iterable<ID> ids) {
		return BaseService.iterableTolist(mainDAO.findAll(ids));
	}
	
	@Override
	public void delete(ID id) {
		mainDAO.delete(id);
	}
	
	/**
	 * 通过实体的空构造方法生成实体（实体必须要有空的构造方法）
	 * @return
	 */
	@Override
	public T createEntity() {
		T entity = null;
		try {
			entity = entityClazz.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	/**
	 * 通过反射获取实体的class
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private Class<T> getEntityClass() {
		Type type = getClass().getGenericSuperclass();
		ParameterizedType pType = (ParameterizedType) type; 
		Type[] types = pType.getActualTypeArguments();
		Class<T> clazz = (Class<T>) types[0];
		return clazz;
	}
}
