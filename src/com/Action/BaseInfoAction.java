package com.Action;

import java.util.ArrayList;

import com.Dao.BaseInfoDao;
import com.Model.BaseInfo;

public class BaseInfoAction extends SuperAction{
	public BaseInfoAction() {
		// TODO Auto-generated constructor stub
		System.out.println("BaseInfoAction 构造方法被执行。。。");
	}
	public String query()
	{	
		BaseInfoDao baseInfoDao = new BaseInfoDao();
		ArrayList<BaseInfo> baseInfos = baseInfoDao.getAllBaseInfo();
		System.out.println("查询完毕");
		session.setAttribute("baseInfos", baseInfos);
		return "showbaseInfos";
	}
}
