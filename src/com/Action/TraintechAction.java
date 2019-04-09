package com.Action;

import java.util.ArrayList;
import com.Dao.TraintechDao;
import com.Model.TraintechModel;
import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.util.EnumMorpher;
import net.sf.json.util.JSONUtils;
import com.Action.SuperAction;

public class TraintechAction extends SuperAction {
	private String postdata;
	/**
	 * 车列评估模型
	 */
	private static final long serialVersionUID = -35087647167251172L;

	public TraintechAction() {
		System.out.println("Traintech 构造方法被执行。。。");
	}

	public String query() {
		System.out.println("query方法被执行");
		TraintechDao TraintechDao = new TraintechDao();
		ArrayList<TraintechModel> traintech = TraintechDao.querysql();
		//EvaluationModelDao evaluationModelDao = new EvaluationModelDao();
		//ArrayList<EvaluationModel> em = evaluationModelDao.getAllEvaluationModels();
		System.out.println("查询完毕");
		session.setAttribute("traintech", traintech);
		return "traintechqr";
	}

	public String submit() {
		System.out.println("sumbit方法被执行");
		JSONArray jsonArray = JSONArray.fromObject(postdata);
		for (int i = 0; i < jsonArray.size(); i++) {
			Object o = jsonArray.get(i);
			JSONObject oev = JSONObject.fromObject(o);
			//EvaluationModel ev = (EvaluationModel) JSONObject.toBean(oev, EvaluationModel.class);
			//EvaluationModelDao evaluationModelDao = new EvaluationModelDao();
			//evaluationModelDao.editEvaluationModels(ev);
			TraintechModel ev = (TraintechModel) JSONObject.toBean(oev, TraintechModel.class);
			TraintechDao TraintechDao = new TraintechDao();
			TraintechDao.editsql(ev);
		}
		System.out.println("修改数据库完毕");
		return "traintechsr";

	}

	public String getPostdata() {
		return postdata;
	}

	public void setPostdata(String postdata) {
		this.postdata = postdata;
	}
}
