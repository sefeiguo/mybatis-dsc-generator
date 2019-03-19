package com.github.mybatis;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.mybatis.entity.BasisInfo;
import com.github.mybatis.util.EntityInfoUtil;
import com.github.mybatis.util.Generator;
import com.github.mybatis.util.MySqlToJavaUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TestMain {
	//基础信息
	public static final String PROJECT="qixingbao-show";
	public static final String AUTHOR="hwh";
	public static final String VERSION="V1.0";
	//数据库连接信息
	public static final String URL="jdbc:mysql://127.0.0.1:3306/mysql?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&useSSL=true";
	public static final String NAME="root";
	public static final String PASSWORD="123456";
	public static final String DATABASE="mysql";
	//类信息 如果多个以逗号分隔
	public static final String TABLE="tb_log,plugin";
	public static final String CLASSCOMMENT="用户,plugin";
	public static final String TIME=new SimpleDateFormat("yyyy年MM月dd日").format(System.currentTimeMillis());
	public static final String AGILE=System.currentTimeMillis()+"";
	//路径信息
	public static final String baseUrl = "com.qixingbao.show";
	public static final String ENTITY_URL=baseUrl+".entity";
	public static final String DAO_URL=baseUrl+".dao";
	public static final String XML_URL=baseUrl+".dao.impl";
	public static final String SERVICE_URL=baseUrl+".service";
	public static final String SERVICE_IMPL_URL=baseUrl+".service.impl";
	public static final String CONTROLLER_URL=baseUrl+".api";
	
	
	public static void main(String[] args) {
		String []tables = TABLE.split(",");
		String []classComment = CLASSCOMMENT.split(",");
		if(tables.length!=classComment.length){
			System.out.println("表对应类的注释信息不匹配，请参考length:"+TABLE+"!="+CLASSCOMMENT+"");
			System.exit(1);
		}
		int i=0;
		for(String table:tables) {
			BasisInfo bi = new BasisInfo(PROJECT, AUTHOR, VERSION, URL, NAME, PASSWORD, DATABASE, TIME, AGILE, ENTITY_URL, DAO_URL, XML_URL, SERVICE_URL, SERVICE_IMPL_URL, CONTROLLER_URL);
			bi.setTable(table);
			bi.setEntityName(MySqlToJavaUtil.getClassName(table));
			bi.setObjectName(MySqlToJavaUtil.changeToJavaFiled(table));

			bi.setEntityComment(classComment[i]);
			try {
				bi = EntityInfoUtil.getInfo(bi);
				String projectPath = "/opt/" + PROJECT + "/src/main/java/";
				String aa1 = Generator.createEntity(projectPath, bi).toString();
				String aa2 = Generator.createDao(projectPath, bi).toString();
				String aa3 = Generator.createDaoImpl(projectPath, bi).toString();
				String aa4 = Generator.createService(projectPath, bi).toString();
				String aa5 = Generator.createServiceImpl(projectPath, bi).toString();
				String aa6 = Generator.createController(projectPath, bi).toString();

				System.out.println(aa1);
				System.out.println(aa2);
				System.out.println(aa3);
				System.out.println(aa4);
				System.out.println(aa5);
				System.out.println(aa6);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			i++;
		}
	}
}
