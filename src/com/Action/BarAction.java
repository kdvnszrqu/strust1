package com.Action;

import java.util.ArrayList;
import com.Dao.BarDao;
import com.Model.Bar;

import net.sf.json.JSONArray;
import com.Action.SuperAction;

public class BarAction extends SuperAction{

	private JSONArray barlist;
	private String result;
	
	public BarAction() {
		// TODO Auto-generated constructor stub
		System.out.println("BarAction 构造方法被执行。。。");
	}
    
    @Override
    public String execute() throws Exception {
    	System.out.println("开始请求......");
    	BarDao barDao = new BarDao();
    	ArrayList<Bar> list = barDao.getAllBars();
    	barlist = JSONArray.fromObject(list);
        //root已经是json格式
        //对应的结果集type为json，可以直接返回json格式数据
        System.out.println("json: " + barlist.toString());
        result=barlist.toString();
//        result="[{'name':'1111','num':2}]";
        return SUCCESS;
    }
    

	public JSONArray getBarlist() {
		return barlist;
	}
	public void setBarlist(JSONArray barlist) {
		this.barlist = barlist;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
}
