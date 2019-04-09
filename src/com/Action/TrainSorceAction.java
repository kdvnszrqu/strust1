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
		System.out.println("TrainSorceAction ���췽����ִ�С�����");
	}
	
	@Override
	public String execute() throws Exception {
    	System.out.println("��ʼ����......");
    	
    	TrainSorceDao trainSorceDao = new TrainSorceDao();
    	ArrayList<TrainSorce> list = trainSorceDao.getAllTrainSorce();
    	
    	session.setAttribute("TrainSorcelist", list);
    	
    	TrainSorcelist = JSONArray.fromObject(list);
        //root�Ѿ���json��ʽ
        //��Ӧ�Ľ����typeΪjson������ֱ�ӷ���json��ʽ����
        System.out.println("json: " + TrainSorcelist.toString());
        result=TrainSorcelist.toString();
        return SUCCESS;
    }
}
