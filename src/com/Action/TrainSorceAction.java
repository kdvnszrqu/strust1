package com.Action;

import java.util.ArrayList;

import com.Dao.TrainSorceDao;
import com.Model.TrainSorce;

import net.sf.json.JSONArray;

public class TrainSorceAction extends SuperAction{
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
	
	public TrainSorceAction() {
		// TODO Auto-generated constructor stub
		System.out.println("TrainSorceAction 构造方法被执行。。。");
	}
	
	@Override
	public String execute() throws Exception {
    	System.out.println("开始请求......");
    	
    	TrainSorceDao trainSorceDao = new TrainSorceDao();
    	ArrayList<TrainSorce> list = trainSorceDao.getAllTrainSorce();
    	
    	session.setAttribute("TrainSorcelist", list);
    	
    	TrainSorcelist = JSONArray.fromObject(list);
        //root已经是json格式
        //对应的结果集type为json，可以直接返回json格式数据
        System.out.println("json: " + TrainSorcelist.toString());
        result=TrainSorcelist.toString();
        return SUCCESS;
    }
}
