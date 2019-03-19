/**
 * @filename:${entityName}Dao ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2019 ${author} Co. Ltd.
 * All right reserved. 
 */
package ${daoUrl};

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import ${entityUrl}.${entityName};

/**   
 *  
 * @Description:  ${entityComment}——DAO
 * @Author:       ${author}   
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
@Mapper
public interface ${entityName}Dao {
	
	public ${entityName} selectByPrimaryKey(${idType} id);
	
	public int deleteByPrimaryKey(${idType} id);
	
	public int insertSelective(${entityName} ${objectName});
	
	public int updateByPrimaryKeySelective(${entityName} ${objectName});
	
	public List<${entityName}> listPage(${entityName} ${objectName});
}
	