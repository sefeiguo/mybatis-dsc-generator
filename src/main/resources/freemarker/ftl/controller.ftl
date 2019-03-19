/**
 * @filename:${entityName}Controller ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2018 ${author} Co. Ltd. 
 * All right reserved. 
 */
package ${controllerUrl};

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import ${entityUrl}.${entityName};
import ${serviceUrl}.${entityName}Service;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

/**   
 * 
 * @Description:  ${entityComment}接口层
 * @Author:       ${author}   
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
@Api(description = "${entityComment}",value="${entityComment}" )
@RestController
@RequestMapping("/${objectName}")
@Slf4j
public class ${entityName}Api {

	@Autowired
	public ${entityName}Service ${objectName}Service;
	
	/**
	 * @explain 查询${entityComment}对象  <swagger GET请求>
	 * @param   对象参数：id
	 * @return  ${objectName}
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@GetMapping("/{id}")
	@ApiOperation(value = "获取${entityComment}信息", notes = "获取${entityComment}信息[${objectName}]，作者：${author}")
	@ApiImplicitParam(paramType="path", name = "id", value = "${entityComment}id", required = true, dataType = "${idType}")
	public AjaxResponse get${entityName}ById(@PathVariable("id")${idType} id){
		try {
			${entityName} ${objectName}=${objectName}Service.selectByPrimaryKey(id);
    		AjaxResponse.success("查询成功",${objectName});
		} catch (Exception e) {
			log.error("获取${entityComment}执行异常："+e.getMessage());
    		AjaxResponse.fail("查询失败",e);
		}
		return result;
	}
	
	/**
	 * @explain 添加${entityComment}对象
	 * @param   对象参数：${objectName}
	 * @return  int
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@PostMapping("/insert")
	@ApiOperation(value = "添加${entityComment}", notes = "添加${entityComment}[${objectName}],作者：${author}")
	public AjaxResponse insertSelective(${entityName} ${objectName}){
		try {
			int rg=${objectName}Service.insertSelective(${objectName});
    		AjaxResponse.success("保存成功",rg);
		} catch (Exception e) {
			log.error("添加${entityComment}执行异常："+e.getMessage());
    		AjaxResponse.fail("保存失败",e);
		}
		return result;
	}
	
	/**
	 * @explain 删除${entityComment}对象
	 * @param   对象参数：id
	 * @return  int
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@PostMapping("/delete")
	@ApiOperation(value = "删除${entityComment}", notes = "删除${entityComment},作者：${author}")
	@ApiImplicitParam(paramType="query", name = "id", value = "${entityComment}id", required = true, dataType = "${idType}")
	public AjaxResponse deleteByPrimaryKey(${idType} id){
		try {
			int reg=${objectName}Service.deleteByPrimaryKey(id);
        	AjaxResponse.success("删除成功",reg);
		} catch (Exception e) {
			log.error("删除${entityComment}执行异常："+e.getMessage());
        	AjaxResponse.fail("删除失败",e);
		}
		return result;
	}
	
	/**
	 * @explain 修改${entityComment}对象
	 * @param   对象参数：${objectName}
	 * @return  ${objectName}
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@ApiOperation(value = "修改${entityComment}", notes = "修改${entityComment}[${objectName}],作者：${author}")
	@PostMapping("/update")
	public AjaxResponse updateByPrimaryKeySelective(${entityName} ${objectName}){
		try {
			int reg = ${objectName}Service.updateByPrimaryKeySelective(${objectName});
        	AjaxResponse.success("更新成功",reg);
		} catch (Exception e) {
			log.error("修改${entityComment}执行异常："+e.getMessage());
        	AjaxResponse.fail("更新失败",e);
		}
		return result;
	}
	
	/**
	 * @explain 获取匹配${entityComment}
	 * @param   对象参数：${objectName}
	 * @return  List<${entityName}>
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@ApiOperation(value = "条件查询${entityComment}", notes = "条件查询[${objectName}],作者：${author}")
	@PostMapping("/list")
	public AjaxResponse list(${entityName} ${objectName}){
		try {
			List<${entityName}> list = ${objectName}Service.query${entityName}List(${objectName});
    		AjaxResponse.success("查询成功",list);
		} catch (Exception e) {
			log.error("获取${entityComment}执行异常："+e.getMessage());
    		AjaxResponse.fail("查询失败",e);
		}
		return result;
	}
	
	/**
	 * @explain 分页条件查询${entityComment}   
	 * @param   对象参数：AppPage<${entityName}>
	 * @return  PageInfo<${entityName}>
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@GetMapping("/listPage")
	@ApiOperation(value = "分页查询", notes = "分页查询返回对象[PageInfo<${entityName}>],作者：边鹏")
	@ApiImplicitParams({
        @ApiImplicitParam(paramType="query", name = "start", value = "当前页", required = true, dataType = "int"),
        @ApiImplicitParam(paramType="query", name = "limit", value = "页行数", required = true, dataType = "int")
    })
	public AjaxResponse listPage(${entityName} ${objectName},PageInfo pageInfo){
    	try {
    		return AjaxResponse.success("获取成功!", PageConvertUtils.convertToReport(${objectName}Service.listPage(${objectName},pageInfo)));
    	} catch (Exception e) {
    		log.error("Exception occurred.", e);
    		return AjaxResponse.fail("获取失败!", e);
    	}
	}
}