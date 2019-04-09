package com.Dao;

import java.util.ArrayList;
import java.util.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import com.Dbutil.Dbutil;
import com.Model.CartechModel;

public class CartechDao {
	// 获得所有的车辆状态评估模型
	protected Connection conn = null;
	protected PreparedStatement stmt = null;
	protected ResultSet rs = null;

	public ArrayList<CartechModel> querysql() {
		System.out.println("查询cartech数据表");
		ArrayList<CartechModel> list = new ArrayList<CartechModel>();
		try {
			conn = Dbutil.getConnection();
			String sql = "select distinct id,car_type,body_parm,underframe_parm,bogie_parm,foundation_parm,air_parm,hook_parm,axle_parm,modtime,modifier,version from car_tech;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				CartechModel CartechModel = new CartechModel();
				CartechModel.setId(rs.getInt("id"));
				CartechModel.setCar_type(rs.getString("car_type"));
				CartechModel.setBody_parm(rs.getString("Body_parm"));
				CartechModel.setUnderframe_parm(rs.getString("underframe_parm"));
				CartechModel.setBogie_parm(rs.getString("bogie_parm"));
				CartechModel.setFoundation_parm(rs.getString("foundation_parm"));
				CartechModel.setAir_parm(rs.getString("air_parm"));
				CartechModel.setHook_parm(rs.getString("hook_parm"));
				CartechModel.setAxle_parm(rs.getString("axle_parm"));
				//将timestamp转为Date
				Date time1=new Date(rs.getTimestamp("modtime").getTime());//java.util.Date
				SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String pubtime=formattime.format(time1);
				CartechModel.setModtime(pubtime);
				CartechModel.setModifier(rs.getString("modifier"));
				CartechModel.setVersion(rs.getString("version"));
				list.add(CartechModel);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public  CartechModel editsql(CartechModel cartech) {
		System.out.println("修改cartech数据表");
		Date date = new Date();       
		Timestamp modtime = new Timestamp(date.getTime());
		System.out.println(" modtime:" + modtime);
		int id = cartech.getId();;
		String body_parm = cartech.getBody_parm();
		String underframe_parm = cartech.getUnderframe_parm();
		String bogie_parm = cartech.getBogie_parm();
		String foundation_parm = cartech.getFoundation_parm();
		String air_parm = cartech.getAir_parm();
		String hook_parm = cartech.getHook_parm();
		String axle_parm = cartech.getAxle_parm();
		//String modtime = ev.getModtime();
		String modifier = cartech.getModifier();
		Double d =Double.parseDouble(cartech.getVersion())+0.1;
		
		DecimalFormat df = new DecimalFormat("#.0");
		String  str= df.format(d);
		String version =  String.valueOf(str);
		System.out.println(version);
		String sql = "UPDATE car_tech SET " + 
//		"car_type='" + car_type + 
//		"' ,body_parm='" + body_parm+ 
		"body_parm='" + body_parm+
		"' ,underframe_parm='" + underframe_parm + 
		"' ,bogie_parm='" + bogie_parm + 
		"' ,foundation_parm='"+ foundation_parm + 
		"' ,air_parm='" + air_parm + 
		"' ,hook_parm='" + hook_parm + 
		"' ,axle_parm='"+ axle_parm + 
		"' ,modtime='" + modtime + 
		"' ,modifier='" + modifier + 
		"' ,version='" + version+ 
		"' where id=" + id;
		try {
			conn = Dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			int a = stmt.executeUpdate();
			System.out.println("a:" + a);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out.println(version);
		cartech.setVersion(version);
		Date time2=new Date(modtime.getTime());//java.util.Date
		SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String pubtime=formattime.format(time2);
		//CartechModel.setModtime(pubtime);
		cartech.setModtime(pubtime);
		System.out.println(cartech.getModtime());
		System.out.println(cartech.getVersion());
		return cartech;
	}
}
