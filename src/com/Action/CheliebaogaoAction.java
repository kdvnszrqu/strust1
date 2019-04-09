package com.Action;

import java.util.ArrayList;

import com.Dao.BaseInfoDao;
import com.Dao.TrainSorceDao;
import com.Model.BaseInfo;
import com.Model.TrainSorce;

import net.sf.json.JSONArray;

public class CheliebaogaoAction extends SuperAction{
	public JSONArray getTrainSorcelist() {
		return TrainSorcelist;
	}

	public void setTrainSorcelist(JSONArray trainSorcelist) {
		TrainSorcelist = trainSorcelist;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private JSONArray TrainSorcelist;
	private String result;
	
	public CheliebaogaoAction() {
		// TODO Auto-generated constructor stub
		System.out.println("CheliebaogaoAction 构造方法被执行。。。");
	}
	public String query()
	{	
		BaseInfoDao baseInfoDao = new BaseInfoDao();
		ArrayList<BaseInfo> baseInfos = baseInfoDao.getAllBaseInfo();
		System.out.println("查询baseInfos完毕");
		session.setAttribute("baseInfos", baseInfos);
		
		TrainSorceDao trainSorceDao = new TrainSorceDao();
    	ArrayList<TrainSorce> list = trainSorceDao.getAllTrainSorce();
    	System.out.println("查询trainSorceDao完毕");
    	session.setAttribute("list", list);
        
		return "showCheliebaogao";
	}
}
