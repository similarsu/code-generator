package ${packageName}.controller;

import java.util.Date;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.wzga.core.dao.base.support.Join;
import cn.wzga.core.dao.base.support.Order;
import cn.wzga.core.dao.base.support.Pager;
import cn.wzga.core.dao.base.support.Where;
import cn.wzga.core.util.Constant;
import cn.wzga.core.util.Messages;
import cn.wzga.core.util.PropertyUtil;
import cn.wzga.core.util.StringUtil;
import ${packageName}.controller.BaseController;
import ${packageName}.entity.${className};
import ${packageName}.service.${className}Service;

@Controller
@RequestMapping(value="/${className?lower_case}")
public class ${className}Controller extends BaseController{
	@Resource(name="${className?uncap_first}Service")
	private ${className}Service ${className?uncap_first}Service;
	
	/**
	 * 添加页面
	 * @param ${className?uncap_first}
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toAdd(@ModelAttribute ${className} ${className?uncap_first}){
		return "${className?lower_case}/${className?lower_case}_add";
	}
	/**
	 * 添加数据
	 * @param ${className?uncap_first}
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(@ModelAttribute ${className} ${className?uncap_first}){
		${className?uncap_first}Service.add(${className?uncap_first});
		Messages.setSuccessMessage(ADD_SUCCESS_MSG);
		return "redirect:/${className?lower_case}/list"+Constant.EXT;
	}
	/**
	 * 修改页面
	 * @param id
	 * @param ${className?uncap_first}
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{id}/update",method=RequestMethod.GET)
	public String toUpdate(@PathVariable("id")Long id,@ModelAttribute ${className} ${className?uncap_first}) throws Exception{
		${className} ${className?uncap_first}Temp=${className?uncap_first}Service.load(id);
		PropertyUtil.copyProperties(${className?uncap_first}, ${className?uncap_first}Temp);
		return "${className?lower_case}/${className?lower_case}_update";
	}
	/**
	 * 修改数据
	 * @param ${className?uncap_first}
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@ModelAttribute ${className} ${className?uncap_first}){
		${className?uncap_first}Service.update(${className?uncap_first}<#list columns as column><#if column.isPrivate!=1>, "${column.propName}"</#if></#list>);
		Messages.setSuccessMessage(UPDATE_SUCCESS_MSG);
		return "redirect:/${className?lower_case}/list"+Constant.EXT;
	}
	/**
	 * 列表
	 * @param pageNo
	 * @param pageSize
	 * @param modelMap
	 * @param ${className?uncap_first}
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", required = false, defaultValue = Constant.PAGE_SIZE) int pageSize,
			ModelMap modelMap, @ModelAttribute ${className} ${className?uncap_first}) throws Exception {

		Where where = Where.getInstance(${className?uncap_first})<#list columns as column><#if column.isPrivate!=1>.equal("${className?uncap_first}.${column.propName}", ${className?uncap_first}.get${column.propName?cap_first}()</#if></#list>);
		Pager<${className}> pager = new Pager<${className}>(pageNo, pageSize, where);

		pager = ${className?uncap_first}Service.findPage(pager);

		modelMap.put("pager", pager);

		return "/${className?lower_case}/${className?lower_case}_list";
	}
	/**
	 * 删除数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
	public String delete(@PathVariable(value = "id") Long id) {
		${className?uncap_first}Service.delete(id);

		Messages.setSuccessMessage(DELETE_SUCCESS_MSG);

		return "redirect:/${className?lower_case}/list"+Constant.EXT;

	}
}