/**
 * @filename:${entityName}Service ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2019 ${author} Co. Ltd.
 * All right reserved. 
 */
package ${serviceUrl};

import java.util.List;

import com.infodt.common.PageInfo;
import com.infodt.common.plugin.ReportPage;
import ${entityUrl}.${entityName};
/**   
 *  
 * @Description:  ${entityComment}——SERVICE
 * @Author:       ${author}   
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
public interface ${entityName}Service {
	
	/**
	 * @explain 查询${entityComment}对象
	 * @param   对象参数：id
	 * @return  ${entityName}
	 * @author  ${author}
	 */
	public ${entityName} selectByPrimaryKey(${idType} id);
	
	/**
	 * @explain 删除${entityComment}对象
	 * @param   对象参数：id
	 * @return  int
	 * @author  ${author}
	 */
	public int deleteByPrimaryKey(${idType} id);
	
	/**
	 * @explain 添加${entityComment}对象
	 * @param   对象参数：${entityName}
	 * @return  int
	 * @author  ${author}
	 */
	public int insertSelective(${entityName} ${objectName});
	
	/**
	 * @explain 修改${entityComment}对象
	 * @param   对象参数：${entityName}
	 * @return  int
	 * @author  ${author}
	 */
	public int updateByPrimaryKeySelective(${entityName} ${objectName});
	
	/**
	 * @explain 查询${entityComment}集合
	 * @param   对象参数：${entityName}
	 * @return  List<${entityName}>
	 * @author  ${author}
	 */
	public List<${entityName}> query${entityName}List(${entityName} ${objectName});
	
	/**
	 * @explain 分页查询${entityComment}
	 * @param   对象参数：${entityName}
	 * @return  PageInfo<${entityName}>
	 * @author  ${author}
	 */
	ReportPage listPage(${entityName} ${objectName},PageInfo pageInfo) throws Exception;
}