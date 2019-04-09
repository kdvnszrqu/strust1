package com.Action;

import java.util.ArrayList;

import com.Dao.TrainDao;
import com.Model.train;
import com.Action.SuperAction;

public class TrainAction extends SuperAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -35087647167251172L;
	public TrainAction() {
		// TODO Auto-generated constructor stub
		System.out.println("TrainAction 构造方法被执行。。。");
	}
	public String query()
	{	
		TrainDao trainDao = new TrainDao();
		ArrayList<train> tr = trainDao.getAllTrains();
		System.out.println("查询完毕");
		session.setAttribute("train", tr);
		return "train";
	}
}
