package com.Action;

import java.util.ArrayList;

import com.Dao.BaseInfoDao;
import com.Model.BaseInfo;

public class BaseInfoAction extends SuperAction{
	public BaseInfoAction() {
		// TODO Auto-generated constructor stub
		System.out.println("BaseInfoAction ���췽����ִ�С�����");
	}
	public String query()
	{	
		BaseInfoDao baseInfoDao = new BaseInfoDao();
		ArrayList<BaseInfo> baseInfos = baseInfoDao.getAllBaseInfo();
		System.out.println("��ѯ���");
		session.setAttribute("baseInfos", baseInfos);
		return "showbaseInfos";
	}
}
