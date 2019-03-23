package pers.corvey.exam.controller.common;

import java.io.Serializable;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.corvey.exam.entity.common.BaseEntity;

public interface BaseController<T extends BaseEntity<ID>, ID extends Serializable> {

	/**
	 * 列表页面地址
	 */
	String LIST_PATH = "/list";
	
	/**
	 * 详细信息页面地址 
	 */
	String DETAIL_PATH = "/detail";
	
	/**
	 * 新增或修改页面地址 
	 */
	String INPUT_PATH = "/input";
	
	/**
	 * 删除地址 
	 */
	String DELETE_PATH = "/delete";
	
	/**
	 * 保存地址 
	 */
	String SAVE_PATH = "/save";
	
	/**
	 * 显示列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(LIST_PATH)
	String showListView(Model model);
	
	/**
	 * 显示详细信息页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(DETAIL_PATH)
	String showDetailView(Model model, T entity);
	
	/**
	 * 显示新增或修改信息页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(INPUT_PATH)
	String showInputView(Model model, T entity);
	
	/**
	 * 通过id删除实体
	 * @param id
	 * @return
	 */
	@RequestMapping(DELETE_PATH)
	String deleteById(ID id);
	
}
