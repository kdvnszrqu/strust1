package com.Action;

import java.util.ArrayList;

import com.Dao.CarDao;
import com.Model.car;
import com.Action.SuperAction;

public class CarAction extends SuperAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2148351093022439764L;
	private String car_id;
	public CarAction() {
		// TODO Auto-generated constructor stub
		System.out.println("CarAction 构造方法被执行。。。");
	}
	public String query()
	{	
		CarDao cardao = new CarDao();
		ArrayList<car> car = cardao.getCars(car_id);
		System.out.println("查询完毕");
		session.setAttribute("car", car);
		return "car";
	}
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
}
