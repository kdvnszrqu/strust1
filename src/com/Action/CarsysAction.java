package com.Action;

import java.util.ArrayList;
import com.Dao.CarsysDao;
import com.Model.CarsysModel;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.Action.SuperAction;

public class CarsysAction extends SuperAction {
	private String postdata;
	private String car_type;
	private String subsystem;
	/**
	 * ��������ģ��
	 */
	private static final long serialVersionUID = -35087647167251172L;

	public CarsysAction() {
		System.out.println("Carsys ���췽����ִ�С�����");
	}

	public String query() {
		
		System.out.println("query������ִ��");
		car_type=request.getParameter("car_type");
		subsystem=request.getParameter("subsystem");
		System.out.println("car_type:"+car_type);
		System.out.println("subsystem:"+subsystem);
		CarsysDao CarsysDao = new CarsysDao();
		ArrayList<CarsysModel> Carsys = CarsysDao.querysql(car_type,subsystem);
		System.out.println("��ѯ���1");
		session.setAttribute("carsys",Carsys);
		System.out.println("��ѯ���2");
		for(int i=0;i<Carsys.size();i++){
			System.out.println("��ѯ���3");
			System.out.println(Carsys.get(i).toString());
		}
		return "carsysqr";
	}

	public String submit() {
		System.out.println("sumbit������ִ��");
		JSONArray jsonArray = JSONArray.fromObject(postdata);
		for (int i = 0; i < jsonArray.size(); i++) {
			Object o = jsonArray.get(i);
			//��ֹ����Can't transform property '' from java.lang.String into java.sql.Timestamp������
			//JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String []{"yyyy-MM-dd HH:mm:ss"}));
			JSONObject oev = JSONObject.fromObject(o);
			CarsysModel ev = (CarsysModel) JSONObject.toBean(oev, CarsysModel.class);
			CarsysDao CarsysDao = new CarsysDao();
			CarsysDao.editsql(ev);
		}
		System.out.println("�޸����ݿ����");
		return "carsyssr";

	}

	public String getPostdata() {
		return postdata;
	}

	public void setPostdata(String postdata) {
		this.postdata = postdata;
	}

	public String getCar_type() {
		return car_type;
	}

	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}

	public String getSubsystem() {
		return subsystem;
	}

	public void setSubsystem(String subsystem) {
		this.subsystem = subsystem;
	}


}
