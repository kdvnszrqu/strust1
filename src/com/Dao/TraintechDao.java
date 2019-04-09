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
import com.Model.TraintechModel;


public class TraintechDao {
	// 获得所有的车辆状态评估模型
	protected Connection conn = null;
	protected PreparedStatement stmt = null;
	protected ResultSet rs = null;

	public ArrayList<TraintechModel> querysql() {
		System.out.println("查询traintech数据表");
		ArrayList<TraintechModel> list = new ArrayList<TraintechModel>();
		try {
			conn = Dbutil.getConnection();
			String sql = "select * from train_tech;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				TraintechModel TraintechModel = new TraintechModel();
				TraintechModel.setId(rs.getInt("id"));
				TraintechModel.setCar_type(rs.getString("car_type"));
				TraintechModel.setRepairprocess(rs.getString("repairprocess"));
				TraintechModel.setThresholdpart(rs.getString("thresholdpart"));
				TraintechModel.setThreshold(rs.getString("threshold"));
				TraintechModel.setOverper(rs.getString("overper"));
				//将timestamp转为Date
				Date time1=new Date(rs.getTimestamp("modtime").getTime());//java.util.Date
				SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String pubtime=formattime.format(time1);
				TraintechModel.setModtime(pubtime);
				TraintechModel.setModifier(rs.getString("modifier"));
				TraintechModel.setVersion(rs.getString("version"));
				list.add(TraintechModel);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public boolean editsql(TraintechModel traintech) {
		System.out.println("修改traintech数据表");
		Date date = new Date();       
		Timestamp modtime = new Timestamp(date.getTime());
		System.out.println(" modtime:" + modtime);
		int id = traintech.getId();;
		String repairprocess = traintech.getRepairprocess();
		String thresholdpart = traintech.getThresholdpart();
		String threshold = traintech.getThreshold();
		String overper = traintech.getOverper();
		
		//String modtime = traintech.getModtime();
		String modifier = traintech.getModifier();
		System.out.println("修改人："+modifier);
		//String version = traintech.getVersion()+1;
        Double d =Double.parseDouble(traintech.getVersion())+0.1;
		
		DecimalFormat df = new DecimalFormat("#.0");
		String  str= df.format(d);
		String version =  String.valueOf(str);
		String sql = "UPDATE train_tech SET " + 
//		"car_type='" + car_type + 
//		"' ,body_parm='" + body_parm+ 
		"repairprocess='" + repairprocess+
		"' ,thresholdpart='" + thresholdpart + 
		"' ,threshold='" + threshold + 
		"' ,overper='" + overper + 
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
		return true;
	}
}
